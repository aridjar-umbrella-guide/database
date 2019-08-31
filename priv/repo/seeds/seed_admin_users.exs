alias Database.Repo
alias Database.AdminUsers.AdminUser

Repo.insert(%AdminUser{
  id: 1,
  username: "FirstAdmin",
  email: "admin@dev.com",
  password: Pbkdf2.hash_pwd_salt(System.get_env("ADMIN_PWD")),
  accreditation: "super_admin"
})
