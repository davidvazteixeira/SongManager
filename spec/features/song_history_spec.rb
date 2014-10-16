require "rails_helper"

RSpec.describe 'SongHistory CRUD' do
  context 'Create' do
    it 'should create a new song history' do
      visit song_histories_path
      click_link 'New!'
      fill_in 'song_history_proto_name', :with => 'SongHistoryPronameTest'
      click_button 'Create Song history'
      expect(page).to have_content('SongHistoryPronameTest')
    end
  end

  context 'Index' do
    let!(:song_histories) { create_list(:song_history, 5) }
    it 'should list all song histories' do
      visit song_histories_path
      song_histories.each do |s|
        expect(page).to have_content(s.proto_name)
      end
    end
  end

  context 'Show' do
    let!(:song_history) { create(:song_history) }
    let!(:song_versions) { create_list(:song_version, 5, song_history: song_history) }

    it 'should show the song proto-name' do
      visit song_history_path(song_history)
      expect(page).to have_content(song_history.proto_name)
    end

    it 'should list all the song versions' do
      visit song_history_path(song_history)
      for song_version in song_versions
        expect(page).to have_content(song_version.name)
      end
    end

  end

  context 'Edit' do
    let!(:song_history) { create(:song_history) }
    it 'should rename a song history' do
      visit edit_song_history_path(song_history)
      new_song_version_name = "SHNew#{song_history.id}"
      fill_in 'song_history_proto_name', :with => new_song_version_name
      click_button 'Update Song history'
      expect(page).to have_content(new_song_version_name)
    end
  end

  context 'Remove' do
    let!(:song_histories) { create_list(:song_history, 3) }
    let(:target_song_history) { song_histories[1] }
    let(:target_song_history_name) { "remove-#{target_song_history.id}-sh" }

    it 'should remove a song history' do
      visit song_histories_path
      click_link target_song_history_name
      expect(page).to have_no_content(target_song_history.proto_name)
    end
  end

end
