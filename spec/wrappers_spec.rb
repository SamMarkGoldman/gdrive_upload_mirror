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
0B3oKY7yYQojlc0tlTDM1VjdHVWM   20161120_atc_wyh_alt_dinner.mp3                                bin    3.2 MB   2016-11-27 18:11:53
1v0Ta4p0Y0P_U_xz-lp6doNHfgfAUB9uj   12-20171110_me_hr2_return-rem.mp3                              bin    468.3 KB   2017-11-10 07:34:28
1a-lrDf_8Pc8_0-hnYwfydp4LRmQ9TlEi   13-20171106_atc_community_whe...ing_from_church_massacre.mp3   bin    3.6 MB     2017-11-06 18:26:04
1izLafGxcZcw-bqQvmdPLMK4gbtkl3miL   13-20171107_atc_trump_and_the..._year_after_the_election.mp3   bin    5.5 MB     2017-11-07 18:27:19
1ttiAHxGs5ohgIxNAG8qC2UG-AyHPgBz-   13-20171109_atc_bruce_springs...with_an_economics_lesson.mp3   bin    3.4 MB     2017-11-09 18:27:40
1F50SvDQ20mBMf5-KKUG_ZdmE4QUUJg_b   13-20171110_atc_president_tru..._to_asia-pacific_leaders.mp3   bin    3.6 MB     2017-11-10 18:28:14
18pwSZOUPizh3HE8r-ecXiy5K6sUu1hDk   13-20171110_me_trump_in_vietnam_for_economic_summit.mp3        bin    3.1 MB     2017-11-10 07:34:31
1_X2_rSOO7RkCWvL4-9kRLcdPnIe9ah9Y   14-20171107_atc_what_happens_...aught_to_see_like_humans.mp3   bin    2.1 MB     2017-11-07 18:27:22
1Lr1U-M99GgFuBkcBIylXyT9HGjuquseA   14-20171108_me_family_of_amer...pushes_for_prisoner_swap.mp3   bin    2.0 MB     2017-11-08 07:33:14
1MU3LkkVNbcQcwpz-AEI5bYmI8uZg_Wx5   14-20171109_me_has_trumps_pow...e_att-time_warner_merger.mp3   bin    3.7 MB     2017-11-09 07:46:22
1Ra_y8pCoiOGvcyAdHye9cCnEesDAA72-   14-20171110_atc_standing_up_i...ecrets_finally_go_public.mp3   bin    4.2 MB     2017-11-10 18:28:19
14_vOniKAag-HcC_mComLKlpGVXOkG8Db   14-20171110_me_in_france_wome...ual_harassers_on_twitter.mp3   bin    3.8 MB     2017-11-10 07:46:38
1dOpAq5nijIB--pZJAinJLX93WSC9QtNm   14-20171110_me_the_old_taylors_not_dead.mp3                    bin    3.7 MB     2017-11-10 07:34:34
1MDTiR9YhdfpARe-a6cR__dJSa6WGKZlk   15-20171109_atc_dallas_cowboy...empt_to_block_suspension.mp3   bin    3.5 MB     2017-11-09 18:27:47
1DLzt5Sdno3oF-rJlDniiI5ajUPXUN9xU   15-20171110_atc_standing_up_i...ecrets_finally_go_public.mp3   bin    4.2 MB     2017-11-11 17:28:53
1p5FcAWjh-3gQujidNyIPZL1WhWyOYkNy   15-20171110_me_the_old_taylors_not_dead.mp3                    bin    3.7 MB     2017-11-10 07:46:41
1MCPFwJ-JytPH9D5EAPXi5qii_V9ZkbkV   16-20171106_atc_jury_begins_d...enendez_corruption_trial.mp3   bin    3.7 MB     2017-11-06 18:26:16
1dELq-xu12jkledWSMc7JY0SUPVQr0AJ3   16-20171107_atc_more_than_hal...asnt_discussed_with_them.mp3   bin    4.4 MB     2017-11-07 18:27:29
1V5NVC3Cz-__LUIl9ZN5Ch-A-7DgtAYtN   16-20171109_atc_former_kgb_ag...sia_in_the_2016_election.mp3   bin    3.1 MB     2017-11-09 18:27:50
1q_q-ZEToTcb1_padXz1wWEM2ipuiDRzh   16-20171110_atc_german_consum...ers_in_emissions_scandal.mp3   bin    3.7 MB     2017-11-11 17:28:56
1cJ5ZSAPl2HKl-27nqlUaUjS1lm0yT-Wk   16-20171110_atc_kenneth_brana...er_on_the_orient_express.mp3   bin    7.6 MB     2017-11-10 18:28:27
1s3qWV-YBMXZvdMFXN04FxqXSb0iFyGTv   16-20171110_me_roy_moore_folo.mp3                              bin    5.0 MB     2017-11-11 07:34:02
1q-73lA4r-k7AVVTfdZtHZttlQIdrBqNO   17-20171110_atc_kenneth_brana...er_on_the_orient_express.mp3   bin    7.6 MB     2017-11-11 17:29:01
1tySSL3qS1-pz5RpDs7okich3MIEiXUdg   17-20171110_me_china_bike_share.mp3                            bin    4.6 MB     2017-11-11 07:34:06
1kegGn4vB9VbweCjarnHcciYLSlw8d-Pz   18-20171107_atc_nasa_astronau...ordon_has_died_at_age_88.mp3   bin    2.8 MB     2017-11-07 18:27:35
1VQlj84Lcdkt81kYp0bGQPlFGPCH-pcFm   18-20171108_me_2016_election_one_year_later.mp3                bin    3.8 MB     2017-11-08 08:16:04}
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

    it 'has keys without elipses' do
      subject.keys.each do |k|
        expect(k).not_to include '...'
      end
    end

    it 'has keys to be max 29 chars' do
      subject.keys.each do |k|
        expect(k.length).to be <= 29
      end
    end
  end

  describe '#remote_file_ids_to_remove' do
    let (:result) { ["0B3oKY7yYQojlQndsenJvdlcwVHM", "0B3oKY7yYQojlZVh2eThwZ1REM3M"] }

    subject { remote_file_ids_to_remove('npr_mp3', 'y') }

    before do
      allow(Dir).to receive(:[]) {
        [
          "../foo/20161120_atc_a_tribe_called_r...wn_its_powwow-step_style.mp3",
          "../foo/20161120_atc_brazil-barberships-machismo.mp3",
          "../foo/20161120_atc_civil_rights_issues_in_appointments.mp3",
          "../foo/20161120_atc_germany_merkel_runs_again.mp3",
          "../foo/20161120_atc_south_korea_presidential_protest.mp3",
          "../foo/20161120_atc_unc_student_body_prez.mp3",
          "../foo/20161120_atc_wyh_alt_dinner.mp3",
          "../foo/12-20171110_me_hr2_return-rem.mp3",
          "../foo/13-20171106_atc_community_whe...ing_from_church_massacre.mp3",
          "../foo/13-20171107_atc_trump_and_the..._year_after_the_election.mp3",
          "../foo/13-20171109_atc_bruce_springs...with_an_economics_lesson.mp3",
          "../foo/13-20171110_atc_president_tru..._to_asia-pacific_leaders.mp3",
          "../foo/13-20171110_me_trump_in_vietnam_for_economic_summit.mp3",
          "../foo/14-20171107_atc_what_happens_...aught_to_see_like_humans.mp3",
          "../foo/14-20171108_me_family_of_amer...pushes_for_prisoner_swap.mp3",
          "../foo/14-20171109_me_has_trumps_pow...e_att-time_warner_merger.mp3",
          "../foo/14-20171110_atc_standing_up_i...ecrets_finally_go_public.mp3",
          "../foo/14-20171110_me_in_france_wome...ual_harassers_on_twitter.mp3",
          "../foo/14-20171110_me_the_old_taylors_not_dead.mp3",
          "../foo/15-20171109_atc_dallas_cowboy...empt_to_block_suspension.mp3",
          "../foo/15-20171110_atc_standing_up_i...ecrets_finally_go_public.mp3",
          "../foo/15-20171110_me_the_old_taylors_not_dead.mp3",
          "../foo/16-20171106_atc_jury_begins_d...enendez_corruption_trial.mp3",
          "../foo/16-20171107_atc_more_than_hal...asnt_discussed_with_them.mp3",
          "../foo/16-20171109_atc_former_kgb_ag...sia_in_the_2016_election.mp3",
          "../foo/16-20171110_atc_german_consum...ers_in_emissions_scandal.mp3",
          "../foo/16-20171110_atc_kenneth_brana...er_on_the_orient_express.mp3",
          "../foo/16-20171110_me_roy_moore_folo.mp3",
          "../foo/17-20171110_atc_kenneth_brana...er_on_the_orient_express.mp3",
          "../foo/17-20171110_me_china_bike_share.mp3",
          "../foo/18-20171107_atc_nasa_astronau...ordon_has_died_at_age_88.mp3",
          "../foo/18-20171108_me_2016_election_one_year_later.mp3"
        ]
      }
    end

    it 'finds the two not online' do
      expect(subject.sort).to eq result.sort
    end
  end

end