require 'test_helper'

class TeamsTest < ActionDispatch::IntegrationTest

  def test_team_create_and_list_on_index
    number_of_teams = 5

    number_of_teams.times do
      FactoryGirl.create(:team)
    end

    # request the index as index
    get '/teams.json'

    # Test if status is success
    assert_equal 200, status

    assert_equal number_of_teams, JSON.parse(response.body).length
  end

  def test_create_team_add_to_db
    post '/teams.json', {
      params: {
        team: {
          name: "Ferrari",
          country: "Italy",
          engine_manufacturer: "Ferrari",
          debut_year: 1955,
          number_of_constructor_championship: 18,
          number_of_driver_championship: 22,
          number_of_poles: 222
        }
      }
    }

    json = JSON.parse(response.body)

    assert_equal 201, status

    assert_equal "Ferrari", json["name"]
    assert_equal 18, json["number_of_constructor_championship"]
    assert_equal "Ferrari", json["engine_manufacturer"]
    assert_equal 1955, json["debut_year"]
    assert json["drivers"]
  end

  def test_team_cannot_be_created_improperly_without_debut_year
    post '/teams.json', {
      params: {
        team: {
          name: "Ferrari",
          country: "Italy",
          engine_manufacturer: "Ferrari",
          number_of_constructor_championship: 18,
          number_of_driver_championship: 22,
          number_of_poles: 222
        }
      }
    }

    json = JSON.parse(response.body)

    assert_equal 422, status

    assert_equal 2, json["debut_year"].length
    assert_equal ["is not a number", "is the wrong length (should be 4 characters)"], json["debut_year"]
  end

  def test_index_of_team_with_drivers
    3.times do
      FactoryGirl.create(:team_with_drivers)
    end

    # request the index as index
    get '/teams.json'

    json = JSON.parse(response.body)

    first_team = json.first

    assert_not_equal [], first_team["drivers"]
  end
end
