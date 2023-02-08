# frozen_string_literal: true
require "rails/generators/active_record"

module ActiveAdminReports
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Active Admin Reports and generates the necessary migrations"
      argument :name, type: :string, default: "ActiveAdminReport"

      source_root File.expand_path("templates", __dir__)

      def create_migrations
        migration_template "migrations/create_active_admin_reports.rb.erb", "db/migrate/create_#{name.underscore.pluralize}.rb"
      end

      def set_up_admin_resource
        template "active_admin_report.rb.erb", "app/models/#{name.underscore}.rb"
        template "active_admin_reports.rb.erb", "app/admin/#{name.underscore.pluralize}.rb"
      end
    end
  end
end
