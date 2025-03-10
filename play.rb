#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/player_types'
require_relative 'lib/attributes'
require_relative 'lib/life_forms/human'
require_relative 'lib/equipment'

# Create a player
player = Player.new(
  name: 'Hero',
  world: 'Fantasy World',
  life_form: Human.new,
  type: PlayerTypes::WARRIOR,
  story: 'A brave warrior from the north',
  base_attributes: {
    Attributes::Names::STR => 2,
    Attributes::Names::DEX => 1,
    Attributes::Names::CON => 2,
    Attributes::Names::INT => 0,
    Attributes::Names::WIS => 0,
    Attributes::Names::CHA => 1
  }
)

# Create some equipment
sword = Equipment.new(
  name: 'Steel Sword',
  description: 'A sharp steel sword',
  attribute_mods: { Attributes::Names::STR => 1 },
  effort_mods: { Efforts::Names::WEAPONS_AND_TOOLS => 1 },
  defense_mod: 2
)

shield = Equipment.new(
  name: 'Wooden Shield',
  description: 'A sturdy wooden shield',
  attribute_mods: { Attributes::Names::CON => 1 },
  effort_mods: { Efforts::Names::BASIC => 1 },
  defense_mod: 3
)

# Print initial state
puts "\n=== Initial Player State ==="
puts "Name: #{player.name}"
puts "Type: #{player.type}"
puts "Life Form: #{player.life_form.class.name}"
puts "\nAttributes:"
player.attributes.each { |attr, value| puts "  #{attr}: #{value}" }
puts "\nEfforts:"
player.efforts.each { |effort, value| puts "  #{effort}: #{value}" }
puts "\nHealth: #{player.current_health}/#{player.max_health} (#{player.hearts} hearts)"
puts "Defense: #{player.defense}"

# Equip items
puts "\n=== Equipping Items ==="
player.equip(sword)
puts "Equipped: #{sword.name}"
player.equip(shield)
puts "Equipped: #{shield.name}"

# Print updated state
puts "\n=== Updated Player State ==="
puts 'Attributes:'
player.attributes.each { |attr, value| puts "  #{attr}: #{value}" }
puts "\nEfforts:"
player.efforts.each { |effort, value| puts "  #{effort}: #{value}" }
puts "\nHealth: #{player.current_health}/#{player.max_health} (#{player.hearts} hearts)"
puts "Defense: #{player.defense}"

# Demonstrate damage and healing
puts "\n=== Combat Demo ==="
puts 'Taking 5 damage...'
player.take_damage(5)
puts "Health: #{player.current_health}/#{player.max_health}"
puts 'Healing 3...'
player.heal(3)
puts "Health: #{player.current_health}/#{player.max_health}"
