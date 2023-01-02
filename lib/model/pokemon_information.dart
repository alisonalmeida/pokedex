// To parse this JSON data, do
//
//     final information = informationFromMap(jsonString);

import 'dart:convert';

Information informationFromMap(String str) =>
    Information.fromMap(json.decode(str));

String informationToMap(Information data) => json.encode(data.toMap());

class Information {
  Information({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  final int baseHappiness;
  final int captureRate;
  final Color color;
  final List<Color> eggGroups;
  final EvolutionChain evolutionChain;
  final dynamic evolvesFromSpecies;
  final List<FlavorTextEntry> flavorTextEntries;
  final List<dynamic> formDescriptions;
  final bool formsSwitchable;
  final int genderRate;
  final List<Genus> genera;
  final Color generation;
  final Color growthRate;
  final Color habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<Name> names;
  final int order;
  final List<PalParkEncounter> palParkEncounters;
  final List<PokedexNumber> pokedexNumbers;
  final Color shape;
  final List<Variety> varieties;

  factory Information.fromMap(Map<String, dynamic> json) => Information(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: Color.fromMap(json["color"]),
        eggGroups:
            List<Color>.from(json["egg_groups"].map((x) => Color.fromMap(x))),
        evolutionChain: EvolutionChain.fromMap(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        formDescriptions:
            List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromMap(x))),
        generation: Color.fromMap(json["generation"]),
        growthRate: Color.fromMap(json["growth_rate"]),
        habitat: Color.fromMap(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(
            json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromMap(x))),
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromMap(x))),
        shape: Color.fromMap(json["shape"]),
        varieties: List<Variety>.from(
            json["varieties"].map((x) => Variety.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color.toMap(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toMap())),
        "evolution_chain": evolutionChain.toMap(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toMap())),
        "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": List<dynamic>.from(genera.map((x) => x.toMap())),
        "generation": generation.toMap(),
        "growth_rate": growthRate.toMap(),
        "habitat": habitat.toMap(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "order": order,
        "pal_park_encounters":
            List<dynamic>.from(palParkEncounters.map((x) => x.toMap())),
        "pokedex_numbers":
            List<dynamic>.from(pokedexNumbers.map((x) => x.toMap())),
        "shape": shape.toMap(),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toMap())),
      };
}

class Color {
  Color({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Color.fromMap(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  final String url;

  factory EvolutionChain.fromMap(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    
    
  });

  final String flavorText;
  
  factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
      );

  Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
      };
}

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  final String genus;
  final Color language;

  factory Genus.fromMap(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Color.fromMap(json["language"]),
      );

  Map<String, dynamic> toMap() => {
        "genus": genus,
        "language": language.toMap(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Color language;
  final String name;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Color.fromMap(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
      };
}

class PalParkEncounter {
  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  final Color area;
  final int baseScore;
  final int rate;

  factory PalParkEncounter.fromMap(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: Color.fromMap(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toMap() => {
        "area": area.toMap(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  final int entryNumber;
  final Color pokedex;

  factory PokedexNumber.fromMap(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Color.fromMap(json["pokedex"]),
      );

  Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokedex": pokedex.toMap(),
      };
}

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  final bool isDefault;
  final Color pokemon;

  factory Variety.fromMap(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromMap(json["pokemon"]),
      );

  Map<String, dynamic> toMap() => {
        "is_default": isDefault,
        "pokemon": pokemon.toMap(),
      };
}
