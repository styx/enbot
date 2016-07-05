use Mix.Config

# You can configure for your application as:
#
#     config :enbot, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:enbot, :key)

config :nadia,
  token: System.get_env("DENOMINATED_EN_BOT_TOKEN")

# import_config "#{Mix.env}.exs"
