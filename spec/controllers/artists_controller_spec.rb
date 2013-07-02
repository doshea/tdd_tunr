require 'spec_helper'

describe ArtistsController do

  # describe 'inheritance' do
  #   it 'inherits from ApplicationController' do
  #     expect(ArtistsController.is_a?(ApplicationController)).to be true
  #   end
  # end
  describe 'collection' do
    describe 'GET #index' do
      it 'assigns all artists to an instance variable' do
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
        it 'assigns a new artist to an instance variable' do
          get :new
          assigns(:artist).should be_an_instance_of(Artist)
          assigns(:artist).should be_new_record
        end
        it 'renders the :new view' do
          get :new
          response.should render_template :new
        end

    end
  end

  describe 'member' do
    let(:artist) { create(:artist) }

    describe 'GET #edit' do
      before { get :edit, id: artist }
      it 'assigns the given artist to an instance variable' do
        assigns(:artist).should eq artist
      end
      it 'renders the :edit view' do
        response.should render_template :edit
      end
    end
    describe 'GET #show' do
      before { get :show, id: artist }
      it 'assigns the given artist to an instance variable' do
        assigns(:artist).should eq artist
      end
      it 'renders the :show view' do
        response.should render_template :show
      end
    end
  end

end

















