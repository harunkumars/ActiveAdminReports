# frozen_string_literal: true
require "rails/generators/active_record"

module ActiveAdminReports
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Active Admin Reports and generates the necessary migrations"

      source_root File.expand_path("templates", __dir__)

      def create_migrations
        migration_template "migrations/create_active_admin_reports.rb.erb", "db/migrate/create_active_admin_reports.rb"
      end

      def set_up_admin_resource
        template "active_admin_report.rb", "app/models/active_admin_report.rb"
        template "active_admin_reports.rb", "app/admin/active_admin_reports.rb"
      end
    end
  end
end
