require 'rails_helper'

RSpec.describe EventsController do
  let(:event) { create(:event) }
  let(:event_hash) { event.attributes }

  describe 'GET #index' do
    before do
      allow(Event).to receive(:all).and_return([event])
    end

    it 'assigns the event ivar with an array of event' do
      get :index
      result = assigns(:events)

      expect(result).to be_a(Array)
      expect(result.first).to be_a(Event)
    end
  end

  describe 'GET #new' do
    before do
      allow(Event).to receive(:new).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :new
      result = assigns(:event)

      expect(result).to be_a(Event)
    end
  end

  describe 'GET #show' do
    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :show, id: 1
      result = assigns(:event)

      expect(result).to be_a(Event)
    end
  end

  describe 'GET #edit' do
    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :edit, id: 1
      result = assigns(:event)

      expect(result).to be_a(Event)
    end
  end

  describe 'GET #destroy' do
    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :destroy, id: 1
      result = assigns(:event)

      expect(result).to be_a(Event)
    end

    it 'display an success message' do
      get :destroy, id: 1
      expect(flash[:success]).to be_present
    end

    it 'redirects to the index of the events if destroy is successful' do
      get :destroy, id: 1

      expect(response).to redirect_to(events_path)
    end
  end

  describe 'GET #update' do
    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :update, id: 1, event: event_hash
      result = assigns(:event)

      expect(result).to be_a(Event)
    end

    describe 'when update is successful' do
      before do
        allow_any_instance_of(Event).to receive(:update).and_return(true)
      end

      it 'redirects to the index of the events if update is successful' do
        get :update, id: 1, event: event_hash

        expect(response).to redirect_to(events_path)
      end
    end

    describe 'when update is unsuccessful' do
      before do
        allow_any_instance_of(Event).to receive(:update).and_return(false)
      end

      it 're-renders the edit page' do
        get :update, id: 1, event: event_hash

        expect(response).to render_template(:edit)
      end

      it 'display an error message' do
        error_messages = ['You forgot something mate!']
        errors = double('errors', full_messages: true)

        allow(errors).to receive(:full_messages).and_return(error_messages)
        allow_any_instance_of(Event).to receive(:errors).and_return(errors)

        get :update, id: 1, event: event_hash

        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'GET #create' do
    before do
      allow(Event).to receive(:new).and_return(event)
    end

    it 'assigns the event ivar with a single event' do
      get :create, event: event_hash
      result = assigns(:event)

      expect(result).to be_a(Event)
    end

    describe 'when create is successful' do
      before do
        allow_any_instance_of(Event).to receive(:save).and_return(true)
      end

      it 'redirects to the index of the events if create is successful' do
        get :create, event: event_hash

        expect(response).to redirect_to(events_path)
      end
    end

    describe 'when create is unsuccessful' do
      before do
        allow_any_instance_of(Event).to receive(:save).and_return(false)
      end

      it 're-renders the edit page' do
        get :create, event: event_hash

        expect(response).to render_template(:new)
      end

      it 'display an error message' do
        error_messages = ['You forgot something mate!']
        errors = double('errors', full_messages: true)

        allow(errors).to receive(:full_messages).and_return(error_messages)
        allow_any_instance_of(Event).to receive(:errors).and_return(errors)

        get :create, id: 1, event: event_hash

        expect(flash[:error]).to be_present
      end
    end
  end
end
