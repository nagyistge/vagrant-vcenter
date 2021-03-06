require 'vagrant'

module VagrantPlugins
  module VCenter
    # Initialize Provider configuration parameters.
    class Config < Vagrant.plugin('2', :config)
      # login attributes

      # The vCenter  hostname
      #
      # @return [String]
      attr_accessor :hostname

      # The username used to log in
      #
      # @return [String]
      attr_accessor :username

      # The password used to log in
      #
      # @return [String]
      attr_accessor :password

      # WIP on these

      # Catalog Name where the item resides
      #
      # @return [String]
      attr_accessor :folder_name

      # Catalog Name where the item resides
      #
      # @return [String]
      attr_accessor :template_folder_name

      # Catalog Item to be used as a template
      #
      # @return [String]
      attr_accessor :datastore_name

      # Virtual Data Center to be used
      #
      # @return [String]
      attr_accessor :datacenter_name

      # Virtual Data Center to be used
      #
      # @return [String]
      attr_accessor :computer_name

      # Virtual Data Center Network to be used
      #
      # @return [String]
      attr_accessor :network_name

      # Virtual Data Center Network to be used
      #
      # @return [Bool]
      attr_accessor :linked_clones

      ##
      ## vCenter  config runtime values
      ##

      # connection handle
      attr_accessor :vcenter_cnx
      attr_accessor :template_id

      def validate(machine)
        errors = _detected_errors

        # TODO: add blank?
        errors <<
        I18n.t('vagrant_vcenter.config.hostname') if hostname.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.username') if username.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.password') if password.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.datastore_name') if datastore_name.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.datacenter_name') if datacenter_name.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.computer_name') if computer_name.nil?
        errors <<
        I18n.t('vagrant_vcenter.config.network_name') if network_name.nil?

        { 'vCenter Provider' => errors }
      end
    end
  end
end
