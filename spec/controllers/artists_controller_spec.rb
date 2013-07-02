require 'spec_helper'

describe ArtistsController do

  # describe 'inheritance' do
  #   it 'inherits from ApplicationController' do
  #     expect(ArtistsController.is_a?(ApplicationController)).to be true
  #   end
  # end

  describe 'GET #index' do
    it 'saves all artists as instance variable' do
      artist = create(:artist)
      artist2 = create(:artist2)
      get :index
      assigns(:artists).should eq [artist, artist2]
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #new' do
      it 'saves a new artist as an instance variable' do
        get :new
        assigns(:artist).should be_an_instance_of(Artist)
        assigns(:artist).should be_new_record
      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end

  end
  describe 'GET #edit' do
    it 'saves the given artist as an instance variable' do
      artist = create(:artist)
      get :edit, id: artist
      assigns(:artist).should eq artist
    end
    it 'renders the :edit view' do
      artist = create(:artist)
      get :edit, id: artist
      response.should render_template :edit
    end








    #Make the tests for artists#show and make them pass
  end

end














