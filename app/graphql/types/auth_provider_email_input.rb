# frozen_string_literal: true

module Types
  # Create a type for the authentication provider
  class AuthProviderEmailInput < BaseInputObject
    graphql_name 'AUTH_PROVIDER_EMAIL'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
