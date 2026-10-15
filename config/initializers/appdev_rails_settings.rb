# AppDev Rails Settings (Phase 2 - Professional)
# Consolidated Rails configuration for AppDev projects

Rails.application.configure do
  # Allow unsafe redirects (for student convenience).
  # Rails 8.1 renamed the setting; the guard keeps this file boot-safe on
  # both sides of the fleet upgrade window (8.0 doesn't know the new name).
  if Rails.gem_version >= Gem::Version.new("8.1")
    config.action_controller.action_on_open_redirect = :log
  else
    config.action_controller.raise_on_open_redirects = false
  end
end

# Phase 2 uses standard Rails security defaults
# - Forgery protection is ON
# - belongs_to associations require presence by default
Rails.application.config.action_controller.default_protect_from_forgery = true
Rails.application.config.active_record.belongs_to_required_by_default = true

# Phase 2 apps start from phase 1 code: draft:resource still generates
# hash-argument routes, e.g. get("/movies", { :controller => "movies", :action => "index" }),
# and the Helper Methods starters carry them until the student refactors.
# Rails 8.1 deprecates that shape ahead of 8.2 and prints two warnings per
# route on every boot, grade run and server start. Drop only that message;
# anything else ActionDispatch deprecates still shows. Revisit at the Rails
# 8.2 upgrade, when the routes themselves change.
if Rails.gem_version >= Gem::Version.new("8.1") && Rails.gem_version < Gem::Version.new("8.2")
  Rails.application.config.after_initialize do
    previous = ActionDispatch.deprecator.behavior
    ActionDispatch.deprecator.behavior = lambda do |message, callstack, deprecator|
      next if message.include?("received a hash argument")
      previous.each { |behavior| behavior.call(message, callstack, deprecator) }
    end
  end
end
