require 'spec_helper'

RSpec.describe 'wrappers' do
  before do
    allow(self).to receive(:list) do
      %{Id                             Name      Created
0B3oKY7yYQojlZVRvRzVfN2g3bEk   npr_mp3   2016-11-27 18:00:58}
    end
    allow(self).to receive(:contents) do
      %{Id                             Path                                                           Type   Size     Modified
0B3oKY7yYQojlbVc0Y2VPSkFXUDA   20161120_atc_a_tribe_called_r...wn_its_powwow-step_style.mp3   bin    5.3 MB   2016-11-27 18:10:55
0B3oKY7yYQojlVlhjeHA4NVBJdms   20161120_atc_brazil-barberships-machismo.mp3                   bin    3.5 MB   2016-11-27 18:11:01
0B3oKY7yYQojlMXh4XzhMVDE0eDA   20161120_atc_civil_rights_issues_in_appointments.mp3           bin    4.8 MB   2016-11-27 18:11:09
0B3oKY7yYQojlNW9CS1dxbF8zSVE   20161120_atc_germany_merkel_runs_again.mp3                     bin    3.5 MB   2016-11-27 18:11:15
0B3oKY7yYQojlZVh2eThwZ1REM3M   20161120_atc_movie--daughters_of_the_dust.mp3                  bin    7.7 MB   2016-11-27 18:11:28
0B3oKY7yYQojlMUdYNTNrcnZRSkU   20161120_atc_south_korea_presidential_protest.mp3              bin    3.6 MB   2016-11-27 18:11:35
0B3oKY7yYQojlQndsenJvdlcwVHM   20161120_atc_tribute_to_gwen_ifill.mp3                         bin    3.9 MB   2016-11-27 18:11:41
0B3oKY7yYQojlNWd1LWNrcmNhRzg   20161120_atc_unc_student_body_prez.mp3                         bin    3.3 MB   2016-11-27 18:11:47
0B3oKY7yYQojlc0tlTDM1VjdHVWM   20161120_atc_wyh_alt_dinner.mp3                                bin    3.2 MB   2016-11-27 18:11:53}
    end
  end

  describe '#folder_id_by_name' do
    subject { folder_id_by_name('npr_mp3') }

    it 'returns the id' do
      expect(subject).to eq '0B3oKY7yYQojlZVRvRzVfN2g3bEk'
    end
  end

  describe 'file_id_hash' do
    subject { file_id_hash 'key' }

    it 'returns a hash' do
      expect(subject.is_a? Hash).to be true
    end

    it 'has keys with mp3 suffix' do
      subject.keys.each do |k|
        expect(k[-4..-1]).to eq '.mp3'
      end
    end
  end

  describe '#remote_file_ids_to_remove' do
    let (:result) { ["0B3oKY7yYQojlQndsenJvdlcwVHM", "0B3oKY7yYQojlZVh2eThwZ1REM3M"] }

    subject { remote_file_ids_to_remove('npr_mp3', 'y') }

    before do
      allow(Dir).to receive(:[]) {
        [
          "20161120_atc_a_tribe_called_r...wn_its_powwow-step_style.mp3",
          "20161120_atc_brazil-barberships-machismo.mp3",
          "20161120_atc_civil_rights_issues_in_appointments.mp3",
          "20161120_atc_germany_merkel_runs_again.mp3",
          "20161120_atc_south_korea_presidential_protest.mp3",
          "20161120_atc_unc_student_body_prez.mp3",
          "20161120_atc_wyh_alt_dinner.mp3"
        ]
      }
    end

    it 'finds the two not online' do
      expect(subject.sort).to eq result.sort
    end
  end

end