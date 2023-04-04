# frozen_string_literal: true
require "rails/generators/active_record"

module ActiveAdminReports
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Active Admin Reports and generates the necessary migrations"
      argument :name, type: :string, default: "ActiveAdminReport"
      argument :run_name, type: :string, default: "ActiveAdminReportRun"

      no_commands do
        attr_accessor :report, :report_run, :admin_user, :admin_user_method
      end

      source_root File.expand_path("templates", __dir__)

      def create_migrations
        self.admin_user_method = ActiveAdmin.application.namespace_settings.current_user_method
        admin_user_name = admin_user_method.to_s.split('_')[1..]&.join('_').classify
        self.admin_user = ActiveModel::Name.new(nil, nil, admin_user_name)
        self.report = ActiveModel::Name.new(nil, nil, name.classify)
        self.report_run = ActiveModel::Name.new(nil, nil, run_name.classify)
        migration_template "migrations/create_active_admin_reports.rb.erb", "db/migrate/create_#{report.plural}.rb"
        migration_template "migrations/create_active_admin_report_runs.rb.erb", "db/migrate/create_#{report_run.plural}.rb"
      end

      def set_up_admin_resource
        template "models/active_admin_report.rb.erb", "app/models/#{report.singular}.rb"
        template "models/active_admin_report_run.rb.erb", "app/models/#{report_run.singular}.rb"

        template "admin/active_admin_reports.rb.erb", "app/admin/#{report.plural}.rb"
        template "admin/active_admin_report_runs.rb.erb", "app/admin/#{report_run.plural}.rb"

        template "jobs/active_admin_report_job.rb.erb", "app/jobs/#{report.singular}_job.rb"

        template "views/active_admin_reports/_highlight_code.js",
                 "app/views/admin/#{report.plural}/_highlight_code.js"
        template "views/active_admin_reports/_edit_with_ace.js",
                 "app/views/admin/#{report.plural}/_edit_with_ace.js"
      end
    end
  end
end
