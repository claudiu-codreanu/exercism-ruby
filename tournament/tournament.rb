=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament

    def self.tally(input)
        teams = {}

        input.strip.each_line do |line|
            (name_1, name_2, result) = line.strip.split(";")

            team_1 = Tournament.check_team(teams, name_1)
            team_2 = Tournament.check_team(teams, name_2)

            team_1[:matches] += 1
            team_2[:matches] += 1

            case result
            when "win"
                team_1[:wins] += 1
                team_2[:losses] += 1
            when "draw"
                team_1[:draws] += 1
                team_2[:draws] += 1
            when "loss"
                team_1[:losses] += 1
                team_2[:wins] += 1
            end
        end

        # calculate points
        teams.values.each{|team| team[:points] = team[:wins] * 3 + team[:draws]}

        header = "Team                           | MP |  W |  D |  L |  P"
        rows = teams
                .values
                .sort{|t1, t2| (t1[:points] != t2[:points]) ? (t2[:points] <=> t1[:points]) : (t1[:name] <=> t2[:name])}
                .map {|team| "#{team[:name].ljust(31, " ")}|  #{team[:matches]} |  #{team[:wins]} |  #{team[:draws]} |  #{team[:losses]} |  #{team[:points]}"}

        rows.unshift(header).join("\n") + "\n"
        
    end

private

    def self.check_team(teams, t_name)

        if !teams.keys.include?(t_name)
            teams[t_name] = {
                name: t_name,
                matches: 0,
                wins: 0,
                draws: 0,
                losses: 0,
                points: 0
            }
        end

        teams[t_name]
    end

end