# AppDev Rails Settings (Phase 2 - Professional)
# Consolidated Rails configuration for AppDev projects

Rails.application.configure do
  # Allow unsafe redirects (for student convenience)
  config.action_controller.raise_on_open_redirects = false

  # Allow envoy.fyi to frame the app
  config.content_security_policy do |policy|
    policy.frame_ancestors :self, "https://envoy.fyi"
  end
end

# Phase 2 uses standard Rails security defaults
# - Forgery protection is ON (no skip_forgery_protection in ApplicationController)
# - belongs_to associations require presence by default
