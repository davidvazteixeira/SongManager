require "rails_helper"

RSpec.describe 'SongVersion CRUD' do

  let!(:song_histories) { create_list(:song_history, 5) }

  context 'Create' do
    let!(:song_history) { create(:song_history) }
      it 'should create a new song version' do
        visit song_history_path(song_history)
        click_link 'new-sv'
        fill_in 'song_version_name', :with => "Version_name"
        click_button 'Create Song version'
        expect(page).to have_content("Version_name")
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
    let!(:song_history) { create(:song_history) }
    let!(:song_version) { create(:song_version, song_history: song_history) }

    it 'should remove a song version' do
      visit song_history_song_version_path(song_history, song_version)
      click_link 'del-sv'
      visit song_history_path(song_history)
      expect(page).to have_no_content(song_version.name)
    end
  end
end
