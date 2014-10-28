class ConfirmService
  class << self
    def confirmed?(user)
      auths = user.authentications
      if auths.count == 1 && auths[0].provider == "identity"
        return user.identity.confirmed?
      else
        true
      end
    end
  end
end
