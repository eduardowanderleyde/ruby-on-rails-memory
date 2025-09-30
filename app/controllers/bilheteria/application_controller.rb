module Bilheteria
  class ApplicationController < ::ApplicationController
    before_action :check_feature_flag

    private

    def check_feature_flag
      # libera se a flag estiver true ou se for ambiente de dev
      return if ENV["ENABLE_TICKETING"] == "true" || Rails.env.development?
      redirect_to root_path
    end
  end
end
