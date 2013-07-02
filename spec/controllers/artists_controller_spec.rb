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

      describe 'POST #create' do
        context 'with valid attributes' do

            it 'creates a new artist' do
              expect{
                post :create, artist: attributes_for(:artist)
              }.to change{ Artist.count }.by(1)
            end
            it 'redirects to artists index page' do
              post :create, artist: attributes_for(:artist)
              response.should redirect_to artists_path
            end

        end

        context 'with invalid attributes' do
          let(:artist) { build(:invalid_artist) } #Refactor this out
          it 'does not create a new artist'
          it 're-renders the :new view'
        end
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


    describe 'PUT #update' do

    end

    describe 'DELETE #destroy' do

    end
  end

end









