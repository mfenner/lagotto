object false
cache ['v5', current_user.is_admin_or_staff?, @status]

node(:error) { nil }

node :data do
  partial "v5/status/base", :object => @status
end
