def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Ed'
  fill_in :player_2_name, with: 'Michael'
  click_button 'Submit'
end

def sign_in_and_robo_play
  visit('/')
  fill_in :player_1_name, with: 'Ed'
  fill_in :player_2_name, with: nil
  click_button 'Submit'
end

def attack_and_ok_twice
  2.times do
    click_button('Attack')
    click_button('OK')
  end
end
