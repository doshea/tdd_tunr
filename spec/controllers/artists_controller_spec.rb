require 'spec_helper'

describe ArtistsController do

  subject {ArtistsController}
  it {should < ApplicationController}

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
          it 'does not create a new artist' do
            expect{
              post :create, artist: attributes_for(:invalid_artist)
            }.to change{ Artist.count }.by(0)
          end
          it 're-renders the :new view' do
            post :create, artist: attributes_for(:invalid_artist)
            response.should render_template :new
          end
        end
      end
    end
  end

  describe 'member' do
    let!(:artist) { create(:artist) }

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

    #Remember you have access to the artist variable from the let
    describe 'PUT #update' do
      context 'valid attributes' do
        let(:updated_artist) { build(:updated_artist) }
        it 'assigns the given artist to an instance variable' do
          put :update, id: artist, artist: attributes_for(:updated_artist)
          assigns(:artist).should eq artist
        end
        it 'changes the attributes of the artist' do
          original_name = artist.name
          original_url = artist.url
          put :update, id: artist, artist: attributes_for(:updated_artist)
          #artist local variable may have old (un-updated) attributes
          artist.reload
          #artist local variable has now been updated to match the database entry
          artist.name.should eq updated_artist.name
          artist.name.should_not eq original_name
          artist.url.should eq updated_artist.url
          artist.url.should_not eq original_url
        end
        it 'redirects to the artist page' do
          put :update, id: artist, artist: attributes_for(:updated_artist)
          response.should redirect_to artist_path(artist)
        end
      end
      context 'invalid attributes' do
        it 'assigns the given artist to an instance variable' do
          put :update, id: artist, artist: attributes_for(:invalid_artist)
          assigns(:artist).should eq artist
        end
        it 'does not change the attributes of the artist' do
          original_name = artist.name
          original_url = artist.url
          put :update, id: artist, artist: attributes_for(:invalid_artist)
          #artist local variable may have old (un-updated) or invalid attributes
          artist.reload
          #artist local variable has now been updated to match the database entry
          artist.name.should eq original_name
          artist.name.should_not be_nil
          artist.url.should eq original_url
          artist.url.should_not be_nil
        end
        it 're-renders the edit page' do
          put :update, id: artist, artist: attributes_for(:invalid_artist)
          response.should render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      #before do... what?
      it 'assigns the given artist to an instance variable' do
        delete :destroy, id: artist
        assigns(:artist).should eq artist
      end
      it 'deletes the artist' do
        expect {
          delete :destroy, id: artist
        }.to change { Artist.count }.by(-1)
      end
      it 'redirects to the artists index page' do
        delete :destroy, id: artist
        response.should redirect_to artists_path
      end
    end

  end

end
