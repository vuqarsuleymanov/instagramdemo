package com.instagramdemo

class User {

	transient springSecurityService

	String username
	String password
	String fullname
	String photo
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [newsFeed: NewsFeed, comments: Comments, likes: Likes, followers: Followers]

	static constraints = {
		username blank: false, unique: true,maxSize:30
		password blank: false
		photo nullable: true, blank: true
		fullname  blank: false, nullable:false , maxSize:30
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
