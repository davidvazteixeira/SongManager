require "rails_helper"

RSpec.describe 'SongVersion CRUD' do
  #let!(:song_histories) { create_list(:song_history, 1) }

  context 'Create' do
    it 'should create a new song version' do
      SongHistory.create(proto_name: "History")
      visit song_history_path(1)
      click_link 'new-sv'
      fill_in 'song_version_name',
      :with => "version-1-1-"
      click_button 'Create Song version'
      expect(SongVersion.count).to eq(1)
    end
  end

  context 'Index' do
    it 'should list the song version tree' do
      song_history = SongHistory.create(proto_name: "History")
      (1..5).each do |v|
        SongVersion.create(name: "version-1-#{v}-", song_history_id: 1)
      end
      visit song_history_path(1)
      (1..5).each do |v|
        expect(page).to have_content("version-#{1}-#{v}-")
      end
    end
  end

  context 'Show' do
    it 'should show a song version items'
  end
  context 'Edit' do
    it 'should edit a song version item'
    it 'should warn if not the last song version'
  end
  context 'Remove' do
    it 'should remove a song version'
  end
end
