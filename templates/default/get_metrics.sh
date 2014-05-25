function get_<%= @metrics_name %>() {
  <%= @get_metrics_command %>
  t="<%= @threshold %>"
  u="<%= @unit %>"
}
