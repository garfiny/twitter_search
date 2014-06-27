require 'rails_helper'

describe HomeController do

  describe 'GET show' do
    it 'renders show view' do
      get :show
      expect(response).to render_template(:show)
    end
  end
end
