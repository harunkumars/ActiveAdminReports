# frozen_string_literal: true
require "rails/generators/active_record"

module ActiveAdminReports
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Active Admin Reports and generates the necessary migrations"
      argument :name, type: :string, default: "ActiveAdminReport"
      argument :run_name, type: :string, default: "Run"

      no_commands do
        attr_accessor :report_runs, :admin_user, :admin_user_method
      end

      source_root File.expand_path("templates", __dir__)

      def create_migrations
        self.admin_user_method = ActiveAdmin.application.namespace_settings.current_user_method
        self.admin_user = admin_user_method.to_s.split('_')[1..]&.join('_')
        self.report_runs = [name, run_name].join.underscore.pluralize
        migration_template "migrations/create_active_admin_reports.rb.erb", "db/migrate/create_#{name.underscore.pluralize}.rb"
        migration_template "migrations/create_active_admin_report_runs.rb.erb", "db/migrate/create_#{report_runs}.rb"
      end

      def set_up_admin_resource
        template "models/active_admin_report.rb.erb", "app/models/#{name.underscore}.rb"
        template "models/active_admin_report_run.rb.erb", "app/models/#{report_runs.singularize}.rb"

        template "admin/active_admin_reports.rb.erb", "app/admin/#{name.underscore.pluralize}.rb"
        template "admin/active_admin_report_runs.rb.erb", "app/admin/#{report_runs}.rb"

        template "jobs/active_admin_report_job.rb.erb", "app/jobs/#{name.underscore}_job.rb"

        template "views/active_admin_reports/_highlight_code.js",
                 "app/views/admin/#{name.underscore.pluralize}/_highlight_code.js"
      end
    end
  end
end
