require "rails_helper"

RSpec.describe 'SongVersion CRUD' do

  let!(:song_histories) { create_list(:song_history, 5) }

  context 'Create' do
    it 'should create a new song version' do
      SongHistory.create(proto_name: "History")
      visit song_history_path(1)
      click_link 'new-sv'
      fill_in 'song_version_name', :with => "version-1-1-"
      click_button 'Create Song version'
      expect(SongVersion.count).to eq(1)
    end
  end

  context 'Show' do
    it 'should show a song version items' do
      song_history = SongHistory.create(proto_name: "History")
      song_version = SongVersion.create(name: "version-1-1-", song: "filestring", song_history_id: 1)

      visit song_history_song_version_path(1, 1)
      expect(page).to have_content("version-1-1-")
      expect(page).to have_content("filestring")
    end
  end
  context 'Edit' do
    it 'should edit a song version item' do
      song_history = SongHistory.create(proto_name: "History")
      song_version = SongVersion.create(name: "version-1-1-", song: "filestring", song_history_id: 1)

      visit edit_song_history_song_version_path(1, 1)
      fill_in 'song_version_name', :with => 'MOD-1-1-'
      click_button 'Update Song version'
      expect(page).to have_content('MOD-1-1-')
    end
  end
  context 'Remove' do
    it 'should remove a song version'
  end
end
