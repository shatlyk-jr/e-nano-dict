import 'dart:math';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

//
class SearchState extends State<Search> {
  List<Map<String, dynamic>> _foundWords = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundWords = allUsers;

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allUsers;
    } else {
      results = allUsers
          .where((word) =>
              word["word"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundWords = results;
    });
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: const Text('Search terms'),
      ),
      body: Column(
        children: [
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.amber,
          ),
          Container(
            height: 80,
            color: Colors.blueGrey[900],
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: TextField(
                  inputFormatters: const [],
                  onChanged: (value) {
                    _runFilter(value);
                  },
                  style: const TextStyle(color: Colors.amberAccent),
                  cursorColor: Colors.amber,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.amber),
                      helperStyle: const TextStyle(color: Colors.amber),
                      hintStyle: const TextStyle(color: Colors.amber),
                      suffixStyle: const TextStyle(color: Colors.amber),
                      focusColor: Colors.amber,
                      iconColor: Colors.amber,
                      prefixIconColor: Colors.amber,
                      labelText: "Search",
                      hintText: "Type term that you looking for",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.amber,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.merge(
                          const BorderSide(color: Colors.amber),
                          const BorderSide(color: Colors.amber),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.merge(
                          const BorderSide(color: Colors.amber),
                          const BorderSide(color: Colors.amber),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.merge(
                          const BorderSide(color: Colors.amber),
                          const BorderSide(color: Colors.amber),
                        ),
                      )),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _foundWords.length,
              itemBuilder: (context, index) {
                return ExpansionTileCard(
                  key: ValueKey(Random().nextInt(_foundWords[index]["id"])),
                  turnsCurve: Curves.bounceOut,
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.amber,
                  ),
                  animateTrailing: true,
                  expandedTextColor: Colors.blueGrey[900],
                  expandedColor: const Color.fromARGB(255, 48, 110, 111),
                  borderRadius: BorderRadius.circular(10),
                  baseColor: const Color.fromARGB(255, 4, 18, 26),
                  initialPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  finalPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    _foundWords[index]['word'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(_foundWords[index]['def']),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> allUsers = [
    {
      "id": 1,
      "word": "'A' Stage",
      "def":
          "The condition of low molecular weight of a resin polymer during which the resin is readily soluble and fusible.",
    },
    {
      "id": 1,
      "word": "AB",
      "def": "Designation for high voltage butyl cable.",
    },
    {
      "id": 1,
      "word": "ABCD parameters",
      "def":
          "The set of parameters for a two-port device that relates the input voltage and current to the output voltage and current. The transfer function of a cascaded circuit can be determined from the product of the ABCD parameters for the individual components from input to output.",
    },
    {
      "id": 1,
      "word": "ABP",
      "def": "Designation for butylpolyethylene high voltage cable, 75?C.",
    },
    {
      "id": 1,
      "word": "abrasion resistance",
      "def":
          "A measure of the ability of a wire or wire covering to resist damage by mechanical means.",
    },
    {
      "id": 1,
      "word": "absolute maximum ratings",
      "def":
          "Specifications that, if exceeded, could cause permanent damage to the converter. There are not continuous ratings, and proper operation is not implied.",
    },
    {
      "id": 1,
      "word": "absolute temperature scale",
      "def":
          "The temperature scale whose origin is the temperature at which all molecular motion would cease. The unit is the degree Kelvin (oK), which has the same magnitude as a degree celsius (oC).",
    },
    {
      "id": 1,
      "word": "absorbing clamp",
      "def":
          "A testing fixture, used to measure radiation from a cable, that uses ferrite rings to absorb radiated emissions; power measurements are made by sensing the resulting rf currents induced in the rings.",
    },
    {
      "id": 1,
      "word": "absorption",
      "def":
          "(1) The amount of moisture a given substance will assimilate and retain. An important property consideration in the selection of insulating materials. (2) Loss of power in an optical fiber, resulting from conversion of optical power into heat and caused principally by impurities, such as transition metals and hydroxyl ions, and also by exposure to nuclear radiation.",
    },
    {
      "id": 1,
      "word": "absorptive device",
      "def":
          "A circuit or device that absorbs power, i.e., converts incident electrical energy into heat or some other form of energy, rather than reflecting electrical energy back to the source.",
    },
    {
      "id": 1,
      "word": "absorptive filter",
      "def":
          "A lossy filter that absorbs and dissipates unwanted frequencies as heat. AMP QuietLine filters are absorptive.",
    },
    {
      "id": 1,
      "word": "AC",
      "def":
          "Alternating Current. An electrical current that reverses its direction of flow at regular intervals (ac, 60 hertz [cps] means reversing direction of flow each half cycle or 120 times per second).",
    },
    {
      "id": 1,
      "word": "AC filter",
      "def":
          "A filter circuit that removes unwanted frequencies (harmonics) from a mostly AC current. This would include some EMI filters.",
    },
    {
      "id": 1,
      "word": "AC flux density",
      "def":
          "Number of flux lines per unit of cross-sectional area generated by an alternating magnetic field; Gauss",
    },
    {
      "id": 1,
      "word": "ACA",
      "def":
          "Designation for synthetic tapes, felted asbestos wire with glazed cotton or glass braid overall, 1000V, 90?C.",
    },
    {
      "id": 1,
      "word": "accelerated aging",
      "def":
          "A test in which voltage, temperature, or other test parameters are increased above normal operating values to obtain observable deterioration in a relatively short time. The plotted results give service life within the context of the test.",
    },
    {
      "id": 1,
      "word": "accelerator",
      "def":
          "A chemical additive which hastens a chemical reaction under specific conditions. Another term is promoter.",
    },
    {
      "id": 1,
      "word": "acceptance angle",
      "def":
          "The half-angle of the cone within which incident light is totally internally reflected by the fiber core. It is equal to arcsin (NA).",
    },
    {
      "id": 1,
      "word": "acceptor",
      "def":
          "A material that is intentionally added to a pure semiconductor material to increase the population of free holes in that semiconductor, resulting in a net positive charge. A semiconductor that has had acceptor material added to it is called 'p-type.'",
    },
    {
      "id": 1,
      "word": "access method",
      "def":
          "The method by which networked stations determine when they can transmit data on a shared transmission medium. Also, the software within an SNA processor that controls the flow of information through a network.",
    },
    {
      "id": 1,
      "word": "access provider",
      "def":
          "Organization providing and maintaining network services for subscribers.",
    },
    {
      "id": 1,
      "word": "access rate",
      "def":
          "The transmission speed, in bits per second, of the physical access circuit between the end user and the network.",
    },
    {
      "id": 1,
      "word": "access time",
      "def":
          "The time interval between the instant at which information is: (a) called for from storage and the instant at which delivery is completed, (b) ready for storage and the instant at which storage is completed.",
    },
    {
      "id": 1,
      "word": "accessories",
      "def":
          "Mechanical devices, such as cable clamps and jackscrews, added to connectors to make up the total connector configuration.",
    },
    {
      "id": 1,
      "word": "accumulator",
      "def":
          "Device used for temporary data storage in arithmetic or logic operation. Usually stores one quantity and, on receipt of another, forms the sum and temporarily stores the result.",
    },
    {
      "id": 1,
      "word": "ACR",
      "def": "Designation for cable with corona resisting insulation.",
    },
    {
      "id": 1,
      "word": "Action Pin contact",
      "def":
          "Any of several style contacts manufactured exclusively by AMP, having a split pin to provide gastight retention in a printed circuit board plated thru hole without solder.",
    },
    {
      "id": 1,
      "word": "active device",
      "def":
          "A component that has gain or operates in a non-linear fashion to change the basic character of an electric signal by, for example, amplification or rectification, or a device comprised of such component, for example a transistor switch. A device whose output is dependent upon an external source of power other than the input signal.",
    },
    {
      "id": 1,
      "word": "active element",
      "def":
          "Those components of a circuit that have gain or direct current flow. They change the basic character of the applied electrical signal by rectification, amplification, switching, etc. Examples include diodes, transistors, and SCRs.",
    },
    {
      "id": 1,
      "word": "active high",
      "def":
          "Power switch enable input voltage must exceed the device's defined threshold voltage for the device to turn on (typically 1.5V). Conversely, enable input voltage must fall below the threshold voltage to turn the device off.",
    },
    {
      "id": 1,
      "word": "active low",
      "def":
          "Power switch enable input voltage must fall below the device's defined threshold voltage for the device to turn on (typically 1.5V). Conversely, enable input voltage must exceed the threshold voltage to turn the device off.",
    },
    {
      "id": 1,
      "word": "active network",
      "def": "A circuit that produces gain.",
    },
    {
      "id": 1,
      "word": "active substrate",
      "def":
          "A substrate in which active elements are formed. Silicon is an active substrate in monolithic integrated circuits.",
    },
    {
      "id": 1,
      "word": "A-D converter",
      "def":
          "Analog-to-digital converter. Circuitry which accepts a continuously varying voltage or current input and converts it to a digital output. The input may be dc or ac, the output serial or parallel, binary or decimal.",
    },
    {
      "id": 1,
      "word": "ADA",
      "def":
          "A computer programming language, used by the Department of Defense and named after Lord Byron's daughter, a friend and collaborator of Charles Babbage who conceived the first operating computer.",
    },
    {
      "id": 1,
      "word": "adapter",
      "def":
          "A device usually attached to the rear of connectors that provides for the attachment of harnessing components, such as strain-relief clamps, heat-shrinkable boots, and braid.",
    },
    {
      "id": 1,
      "word": "adder",
      "def":
          "A digital circuit which forms the sum and carry of two or more numbers.",
    },
    {
      "id": 1,
      "word": "address",
      "def":
          "A specific location where data is stored in a memory; a numerical or alphabetical designation of the storage location of data.",
    },
    {
      "id": 1,
      "word": "address field",
      "def":
          "That part of an instruction or word containing an address or operand.",
    },
    {
      "id": 1,
      "word": "adhesive",
      "def":
          "Dual-wall tubing and precoated molded parts whose inner layer melts and flows when heated, fills voids in the areas being covered, and forms a mechanical bond to the substrate. Unlike an encapsulate, an adhesive forms a mechanical bond to the substrate.",
    },
    {
      "id": 1,
      "word": "adhesive liner",
      "def":
          "Lining that melts and flows inside a sleeve or molded part, filling any voids in between the substrate and the sleeve or molded part. DuraSeal has an adhesive liner.",
    },
    {
      "id": 1,
      "word": "admittance",
      "def":
          "The ratio of current to voltage, the reciprocal of impedance. The unit of admittance is the siemens (S). Admittance is typically abbreviated as 'y' or 'Y.'",
    },
    {
      "id": 1,
      "word": "ADSL",
      "def":
          "A new method of transmitting at speeds up to 7 Mbps in one direction over a single copper telephone line, with up to 640 kbps in the other direction.",
    },
    {
      "id": 1,
      "word": "AFC",
      "def":
          "Automatic Frequency Control - In frequency modulated (fm) signal processing, a scheme for automatic tuning of circuitry to input signal. Often used to correct for drift in conventionally tuned circuits.",
    },
    {
      "id": 1,
      "word": "AGC",
      "def":
          "Automatic Gain Control - A feedback system that changes the gain of an amplifier or the attenuation of an attenuator in response to variations in magnitude of the input signal, thereby maintaining the output signal of the system at a constant magnitude.",
    },
    {
      "id": 1,
      "word": "aging",
      "def":
          "(1) Change in the properties of a material over time and under specific conditions. Generally refers to environmental stimulus such as heat and light. (2)Operating a converter under controlled conditions for a predetermined time in order to screen out failures. Also see Burn-in.",
    },
    {
      "id": 1,
      "word": "A-GPS",
      "def": "Assisted GPS",
    },
    {
      "id": 1,
      "word": "AI",
      "def": "See artificial intelligence.",
    },
    {
      "id": 1,
      "word": "air core inductance",
      "def":
          "The inductance that would be measured if the core had unity permeability and the flux distribution remained unaltered. (A measure of the inductance of a coil without a core).",
    },
    {
      "id": 1,
      "word": "air gap",
      "def":
          "A non-magnetic discontinuity in a ferro-magnetic circuit. For example, the space between the poles of a magnet, if filled with brass, wood, or any other non-magnetic material, is nevertheless called an air gap. Air gaps are often introduced into soft ferrite cores to prevent saturation at high DC bias currents or to simply hold a tight inductance tolerance.",
    },
    {
      "id": 1,
      "word": "AL value",
      "def":
          "The inductance rating of a core in nanoHenries per turn squared (nH/N2) based on a peak flux density of 10 gauss (1 milliTesla) at a frequency of 10 kHz. An AL value of 40 would produce 400?H of inductance for 100 turns and 40mH for 1000 turns.",
    },
    {
      "id": 1,
      "word": "aliphatic hydrocarbons",
      "def":
          "Saturated hydrocarbons, such as gasoline and propane, whose molecules do not have carbon atoms in a ring structure.",
    },
    {
      "id": 1,
      "word": "alloy",
      "def":
          "In plastics, a blend of polymers with other polymers or copolymers.",
    },
    {
      "id": 1,
      "word": "alphanumeric",
      "def":
          "Code structures using letters and numerals, often with added special symbols.",
    },
    {
      "id": 1,
      "word": "Alternating Current",
      "def":
          "AC - The movement of charge carriers in a medium where the direction in which the carriers move reverses over time, typically with a fixed period, for example 60 Hz 120 VAC household current.",
    },
    {
      "id": 1,
      "word": "altitude immersion seal",
      "def":
          "A seal able to withstand substantial pressure change (for example, from sea level to 75,000 feet).",
    },
    {
      "id": 1,
      "word": "alumina",
      "def":
          "Refined form of aluminum oxide, pressed in molds and fired to produce a ceramic insulator useful as a substrate for hybrid integrated circuits.",
    },
    {
      "id": 1,
      "word": "aluminum oxide",
      "def":
          "A mechanically strong, tightly adherent, and nonporous film which forms on aluminum when air and water vapor are present. This film helps resist corrosive attack, and is a good insulator.",
    },
    {
      "id": 1,
      "word": "AM",
      "def":
          "Amplitude Modulation - modulation in which the amplitude of a wave is the characteristic subject to variation.",
    },
    {
      "id": 1,
      "word": "ambient temperature",
      "def":
          "The temperature of still air immediately surrounding a component or circuit. A typical method to measure ambient temperature is to record the temperature that is approximately 1/2 inch from the body of the component or circuit.",
    },
    {
      "id": 1,
      "word": "American Society for Testing and Materials",
      "def":
          "ASTM - A nonprofit industry wide organization that formulates test methods and material specifications, and publishes standards, testing methods, recommended practices, definitions, and other materials.",
    },
    {
      "id": 1,
      "word": "American Wire Gauge",
      "def":
          "AWG - System of numerical designations for wire size, based on specified ranges of circular mil area. American Wire Gauge starts with 4/0 (0000) at the largest size, going to 3/0 (000), 2/0 (00), 1/0 (0), 1, 2, and up to 40 and beyond for the smallest sizes.",
    },
    {
      "id": 1,
      "word": "ammeter",
      "def":
          "Instrument designed to measure current flow in amperes. Available for either alternating or direct current. A millimeter measures current flow in milliamperes, and a microammeter in microamperes. See galvanometer.",
    },
    {
      "id": 1,
      "word": "amnesia",
      "def":
          "The tendency over time for a heat-shrinkable elastomeric tubing or molded part to fail to recover completely to its specified recovered size. See Shelf Life.",
    },
    {
      "id": 1,
      "word": "amorphous",
      "def":
          "Having no definite order of crystalline structure. Refers to magnetic materials that are metallurgically non-crystalline in nature.",
    },
    {
      "id": 1,
      "word": "AMP",
      "def":
          "(1)Brand name long associated with the highest quality interconnection products and systems! (2) Ampere - Practical unit of electrical current; the current flow rate (ie, quantity of electrons passing a point in 1 second). Voltage of 1 volt will send a current of 1 ampere through a resistance of 1 ohm.",
    },
    {
      "id": 1,
      "word": "ampacity",
      "def": "See Current-carrying Capacity.",
    },
    {
      "id": 1,
      "word": "AMP-Duragold",
      "def": "AMP trademark for its gold-over-palladium plating.",
    },
    {
      "id": 1,
      "word": "ampere",
      "def":
          "Abbreviated A or amp. Practical unit of electrical current; the current flow rate (ie, quantity of electrons passing a point in 1 second). Voltage of 1 volt will send a current of 1 ampere through a resistance of 1 ohm.",
    },
    {
      "id": 1,
      "word": "ampere turns",
      "def":
          "The product of current (I) flowing in the winding times the number of turns (N).",
    },
    {
      "id": 1,
      "word": "ampere-turns per meter",
      "def": "The MKS unit of magnetizing force, H, as shown by Ampere's Law.",
    },
    {
      "id": 1,
      "word": "amplifier",
      "def":
          "A circuit, device, or component which provides an output signal essentially identical to the input signal, but at a higher power or signal level.",
    },
    {
      "id": 1,
      "word": "amplitude",
      "def":
          "The magnitude of variation in a changing quantity from its zero value. The word requires modification - as with adjectives such as peak, maximum, rms - to designate the specific amplitude in question.",
    },
    {
      "id": 1,
      "word": "Amplitude Modulation",
      "def":
          "AM - The modification of the magnitude of a higher, constant frequency carrier signal controlled by the amplitude and phase of a lower frequency baseband or audio signal.",
    },
    {
      "id": 1,
      "word": "amplitude permeability",
      "def":
          "The quotient of the peak value of flux density and peak value of applied field strength at a stated amplitude of either, with no static field present. (?a)",
    },
    {
      "id": 1,
      "word": "AMPS",
      "def":
          "Advanced Mobile Phone System. The original American standard for analog wireless phone systems, used primarily in North America, Latin America, Australia and parts of Russia and Asia.",
    },
    {
      "id": 1,
      "word": "analog",
      "def":
          "A signal which is continuously variable and, unlike a digital signal, does not have discrete levels. (A slide rule is analog in function.)",
    },
    {
      "id": 1,
      "word": "analog computer",
      "def":
          "Computer which represents numerical quantities as electrical and physical variables. Solutions to mathematical problems are accomplished by manipulating these variables.",
    },
    {
      "id": 1,
      "word": "and gate",
      "def":
          "A logic circuit with two or more input variables. All inputs must be energized - or receive a signal simultaneously - for the output to be energized.",
    },
    {
      "id": 1,
      "word": "anechoic chamber",
      "def":
          "A testing enclosure in which the walls are formed of specially designed material that absorbs incident energy and prevents it from reflecting.",
    },
    {
      "id": 1,
      "word": "Angstrom",
      "def":
          "Unit of distance equal to 10-10 (10E-10) meter. Can be used as a measure of light wavelength, or to indicate the thickness of surface films or oxides. The symbol for angstrom is ?.",
    },
    {
      "id": 1,
      "word": "angular misalignment",
      "def":
          "The loss of optical power caused by deviation from optimum alignment of fiber to fiber or fiber to waveguide.",
    },
    {
      "id": 1,
      "word": "anisotropic",
      "def":
          "A material whose electrical properties vary with different polarization of a traveling wave.",
    },
    {
      "id": 1,
      "word": "anneal",
      "def":
          "To heat a metal and cool slowly to relieve hardness or brittleness that may have occurred naturally or have been induced by pressure or bending.",
    },
    {
      "id": 1,
      "word": "anode",
      "def":
          "The positive lead or pole in batteries, plating apparatus, diodes, etc.",
    },
    {
      "id": 1,
      "word": "anodize",
      "def":
          "Formation of a protective, insulating oxide layer on a metal (eg aluminum) by electrolytic action. Anodized finishes can be natural or any bright decorative color.",
    },
    {
      "id": 1,
      "word": "ANSI",
      "def":
          "American National Standards Institute Inc. - operates a voluntary certification program.",
    },
    {
      "id": 1,
      "word": "ANSI T1.403",
      "def":
          "The performance-monitoring, data-link, and network interface requirements for ESF CSUs as defined by the Exchange Carriers Standards Association. T1.403 specifies automatic performance reports transmitted to the network once per second via the data link. (In an E1 environment, Performance Monitor is the equivalent of T1.403).",
    },
    {
      "id": 1,
      "word": "ANSI T1.413",
      "def": "The interface standard for DMT ADSL.",
    },
    {
      "id": 1,
      "word": "antenna",
      "def":
          "A structure that is intended to radiate electromagnetic waves into or collect electromagnetic energy from space.",
    },
    {
      "id": 1,
      "word": "antistatic",
      "def":
          "Of or pertaining to the ability to either prevent the accumulation of or to enable the dissipation of static charge.",
    },
    {
      "id": 1,
      "word": "anvil",
      "def":
          "The term most commonly used to identify that part of the crimping die - normally stationary - which positions and supports the terminal during crimping. Sometimes referred to as 'nest.'",
    },
    {
      "id": 1,
      "word": "APD",
      "def": "Avalanche photodiode.",
    },
    {
      "id": 1,
      "word": "applicator",
      "def":
          "Tooling used in semi- automatic or automatic machines to crimp strip-form or tape- mounted contacts, terminals, etc. Standard - Installed in a machine to produce a fixed crimp height for a particular size and type of terminal; most commonly used where tooling and product changes are infrequent.; Miniature Quickchange - Designed for quick and easy interchange with other similar applicators in a given machine. Each applicator will, in many cases, handle similar products and various wire sizes (AWG).",
    },
    {
      "id": 1,
      "word": "arc resistance",
      "def":
          "The capacity of insulating material to resist the passage of current on its surface when placed between two electrodes. Arc resistance values are given in seconds. Minimum acceptable arc resistance is approximately 115 seconds. Breakdown usually occurs as a conducting path is burned on the surface of the dielectric material.",
    },
    {
      "id": 1,
      "word": "ARINC",
      "def":
          "Aeronautical Radio, Inc. - a commercial standards group governing connectors, connector sizes, rack and panel configurations, etc, primarily for airborne applications. Connectors which conform to ARINC specifications are sometimes referred to as ARINC connectors.",
    },
    {
      "id": 1,
      "word": "Arithmetic and Logic Unit",
      "def":
          "ALU - That portion of the digital computer hardware in which arithmetic and logic operations are performed.",
    },
    {
      "id": 1,
      "word": "Artificial Intelligence",
      "def":
          "AI - The ability of a computer to perform tasks, such as reasoning and learning, that human intelligence is capable of doing.",
    },
    {
      "id": 1,
      "word": "artwork",
      "def":
          "Topological pattern of an integrated circuit accurately dimensioned for use in maskmaking. Generally a multiple of final mask size, which is usually produced by a step-and-repeat camera process.",
    },
    {
      "id": 1,
      "word": "AS/400",
      "def":
          "A midrange IBM computer system. Originally implemented on twinaxial cable, now generally implemented on UTP cable using baluns.",
    },
    {
      "id": 1,
      "word": "ASCII",
      "def":
          "American Standard Code for Information Interchange. A 7-bit code used to represent 128 unique letters, numbers, and special characters. An eighth bit is used for parity.",
    },
    {
      "id": 1,
      "word": "ASE",
      "def":
          "Designation for service entrance cable, above ground use. Some constructions are suitable for underground use. Covering is flame retardant, moisture resistant, and abuse resistant.",
    },
    {
      "id": 1,
      "word": "ASIC",
      "def": "application specific integrated circuit",
    },
    {
      "id": 1,
      "word": "ASP",
      "def":
          "(1) A filled direct burial telephone cable used in areas subject to rodent attack. It consists of a filled cable core, corrugated aluminum shield, corrugated steel tape, flooding compound and polyethylene jacket. (2) Application Service Provider",
    },
    {
      "id": 1,
      "word": "asperities",
      "def":
          "Microscopic surface elevations due to surface roughness of a material.",
    },
    {
      "id": 1,
      "word": "a-spots",
      "def":
          "Abbreviation for asperity spot, the point of physical contact between an asperity on one surface and another surface.",
    },
    {
      "id": 1,
      "word": "assembler",
      "def":
          "A program that converts the assembly language of a computer program into the machine language of the computer.",
    },
    {
      "id": 1,
      "word": "assembly language",
      "def":
          "Grouped alphabet characters, called mnemonics, that replace the numeric instructions of machine language. A computer language that has one-to-one correspondence with an assembly program.",
    },
    {
      "id": 1,
      "word": "assymetrical transmission",
      "def":
          "Transmission which sends data at different rates in each direction, faster downstream than upstream.",
    },
    {
      "id": 1,
      "word": "ASTM",
      "def":
          "American Society for Testing and Materials - a non-profit industry-wide organization that formulates test methods and material specifications, and publishes standards, testing methods, recommended practices, definitions, and other materials.",
    },
    {
      "id": 1,
      "word": "asynchronous",
      "def":
          "Not all elements of a device or system operating at the same time, nor in a predetermined sequence.",
    },
    {
      "id": 1,
      "word": "asynchronous transmission",
      "def":
          "Transmission in which time intervals between transmitted bits may be of unequal length. Transmission is controlled by start and stop bits which frame each character.",
    },
    {
      "id": 1,
      "word": "ATE",
      "def": "Automatic test equipment.",
    },
    {
      "id": 1,
      "word": "ATM",
      "def":
          "Asynchronous Transfer Mode - communication protocol for broadband transmission of voice, data and video that uses fixed-length packets or cells to switch traffic over the local- and wide-area network.",
    },
    {
      "id": 1,
      "word": "attenuation",
      "def":
          "Power loss resulting in weaker signals in an electrical system as the signals travel along wires. Occurs naturally during wave travel through lines, waveguides, space, or a medium such as water. May be produced intentionally by placing an attenuator in a circuit. Amount of attenuation is generally expressed in decibels or decibels per unit of length. In cables, generally expressed in dB per unit length, usually 100 feet. In optical fibers, it is measured in decibels per kilometer at a specified wavelength. Attenuation measurements are common for voltage, current, and power. For a power ratio, one dB = 10Log10(P1/P2). For a current ratio, one dB = 20Log10(I1/I2). For a voltage ratio, one dB = 10Log10(V1/V2). A dB is equal to 20Log(I1/I2) for current and 20Log(V1/V2) for voltage ratios.",
    },
    {
      "id": 1,
      "word": "attenuation-limited operation",
      "def":
          "The condition in a fiber-optic link when operation is limited by the power of the received signal (rather than by bandwidth or by distortion).",
    },
    {
      "id": 1,
      "word": "attenuator",
      "def":
          "A two port circuit or device that reduces the amplitude of an input signal by a desired amount typically expressed in decibels (dB). Attenuators may be comprised of fixed resistors. PIN diodes or FET's, or combinations of these.",
    },
    {
      "id": 1,
      "word": "atto",
      "def": "A prefix that indicates a factor of 10-18, abbreviated as 'a.'",
    },
    {
      "id": 1,
      "word": "audio amplifier",
      "def":
          "A circuit with one or more stages designed to amplify the audio frequency range (about 20 to 20,000 Hz).",
    },
    {
      "id": 1,
      "word": "autoclaves",
      "def":
          "Closed vessels used for vacuum pressure impregnating, high pressure curing, bonding, sealing, compressing, testing, etc.",
    },
    {
      "id": 1,
      "word": "Automatic Frequency Control",
      "def":
          "AFC - In frequency modulated (fm) signal processing, a scheme for automatic tuning of circuitry to input signal. Often used to correct for drift in conventionally tuned B129circuits.",
    },
    {
      "id": 1,
      "word": "Automatic Gain Control",
      "def":
          "AGC - A feedback system that changes the gain of an amplifier or the attenuation of an attenuator in response to variations in magnitude of the input signal, thereby maintaining the output signal of the system at a constant magnitude.",
    },
    {
      "id": 1,
      "word": "avalanche photodiode",
      "def":
          "A photodiode that exhibits internal amplification of photocurrent through avalanche multiplication of carriers in the junction region.",
    },
    {
      "id": 1,
      "word": "avionics",
      "def": "Application of electronics to aviation and space exploration.",
    },
    {
      "id": 1,
      "word": "AVL",
      "def": "Automotive Vehicle Location",
    },
    {
      "id": 1,
      "word": "AWG",
      "def":
          "American Wire Gauge - gauging system used to size wire (recognized method in the United States). The higher the gauge number, the smaller the conductor size. Every increase of 3 wire gauges is a 50% reduction in cross sectional",
    },
    {
      "id": 1,
      "word": "'B' stage",
      "def":
          "The condition of a resin polymer when it is more viscous, with higher molecular weight, being insoluble but plastic and fusible.",
    },
    {
      "id": 1,
      "word": "B &amp; S",
      "def":
          "Brown &amp; Sharpe Gauge, a wire diameter standard that is the same as AWG.",
    },
    {
      "id": 1,
      "word": "B channel",
      "def": "In ISDN, a full duplex, 64 kbps channel sending data.",
    },
    {
      "id": 1,
      "word": "back mounted",
      "def":
          "A connector attached to the inside of a panel or box with its mounting flanges inside the equipment.",
    },
    {
      "id": 1,
      "word": "backboard",
      "def":
          "Refers to a plywood panel mounted on the wall of a telecom closet. Used to mount the cross connect.",
    },
    {
      "id": 1,
      "word": "backbone",
      "def":
          "The part of the network that carries the heaviest traffic. It is the main trunk cable from which all connections to the network are made.",
    },
    {
      "id": 1,
      "word": "backbone cabling",
      "def":
          "Cabling between floors in a building or between buildings in a campus.",
    },
    {
      "id": 1,
      "word": "backbone network",
      "def":
          "The main artery or link for a private or public network. Typically the backbone carries the lion's share of traffic (data, voice, video or some combination), is capable of carrying significant bandwidth and it is the network to which small/remote networks/links are attached.",
    },
    {
      "id": 1,
      "word": "back-mounted",
      "def":
          "A termination assembly mounted from the inside of a panel or box with its mounting flange inside the equipment.",
    },
    {
      "id": 1,
      "word": "backplane",
      "def":
          "Area of a computer or other equipment where various logic and control elements are interconnected.",
    },
    {
      "id": 1,
      "word": "backscattering",
      "def":
          "The return of a portion of scattered light to the input end of a fiber; the scattering of fight in the direction opposite to its original propagation.",
    },
    {
      "id": 1,
      "word": "bail lock",
      "def":
          "Spring members which are attached to the connector flanges and used to hold mated connectors together.",
    },
    {
      "id": 1,
      "word": "balanced line",
      "def":
          "A two-conductor line in which both conductors have the same impedance with respect to ground. Since noise pickup is equal on both conductors, common-mode interference is cancelled at the load.",
    },
    {
      "id": 1,
      "word": "balanced mixer",
      "def":
          "(1) A type of mixer that forms from two signals A and B third signal C having the form C = (a + A)(b + B). 'Single balanced' implies a = 0, and b ? 0. 'Double balanced' implies a = b = 0. Such mixers can suppress an RF carrier and / or local oscillator in their output spectrum. (2) A hybrid junction circuit with nonlinear impedances, typically Schottky diodes or FET's, driven by a single RF source and a local oscillator (LO) source to produce an intermediate frequency (IF) signal.",
    },
    {
      "id": 1,
      "word": "balanced transmission line",
      "def":
          "A transmission line or circuit in which two branches are electrically alike and symmetrical with respect to a common reference point, usually ground. An applied signal at the input relative to the reference leads to signals at equivalent points in the circuits that have opposite polarity and equal amplitude.",
    },
    {
      "id": 1,
      "word": "ball bond",
      "def":
          "A type of thermocompression bond in which a gold wire is flame-cut to produce a ball-shaped end. The ball-shaped end is then bonded to a metal pad by pressure and heat.",
    },
    {
      "id": 1,
      "word": "ballast",
      "def": "An impedor, used to stabilize the current in the circuit.",
    },
    {
      "id": 1,
      "word": "balun",
      "def":
          "Balanced/Unbalanced - an impedance matching device to connect balanced twisted pair cabling with unbalanced coaxial cable.",
    },
    {
      "id": 1,
      "word": "balun filter",
      "def":
          "Input line filter often used on DC-DC converters that include a differential wound transformer. Balun filters present a low impedance to differential mode signals and a high impedance ot common mode signals.",
    },
    {
      "id": 1,
      "word": "band marking",
      "def":
          "A continuous circumferential band applied to a wire at regular intervals for identification.",
    },
    {
      "id": 1,
      "word": "Band Pass",
      "def":
          "The frequency range over which an inductor or capacitor exhibits a low impedance.",
    },
    {
      "id": 1,
      "word": "Band Pass Filter",
      "def":
          "BPF - A reactive circuit which rejects signals whose frequencies are outside of its passband 3 dB point frequencies and propagates signals whose frequencies are within B189the 3 dB point frequencies.",
    },
    {
      "id": 1,
      "word": "Band Reject Filter",
      "def":
          "BRF - A reactive circuit that rejects signals whose frequencies are within its 3 dB point frequencies and propagates signals whose frequencies are outside its 3 dB point frequencies.",
    },
    {
      "id": 1,
      "word": "Band Stop",
      "def":
          "The frequency range over which an inductor or capacitor exhibits a high impedance.",
    },
    {
      "id": 1,
      "word": "bandwidth",
      "def":
          "1) Indicates a range of frequencies. For example, for a bandpass filter, it is the frequencies passed. For a transmitter and receiver, it is the frequencies that can be transmitted or received. For a transmission system, it is typically the highest frequency transmittable (lower ones can usually be handled). 2) A term used to describe the capacity or amount of traffic (data, voice or video) a certain communications line is capable of accommodating.",
    },
    {
      "id": 1,
      "word": "Bandwidth-limited operation",
      "def":
          "The condition in a fiber-optic link when bandwidth, rather than received optical power, limits performance. This condition is reached when the signal becomes distorted, principally by dispersion, beyond specified limits.",
    },
    {
      "id": 1,
      "word": "Bare Conductor",
      "def": "A conductor not covered with insulating material.",
    },
    {
      "id": 1,
      "word": "barrel",
      "def":
          "The portion(s) of a terminal, splice, or contact that is crimped. When designed to receive the conductor, it is called the wire barrel. When designed to support or grip the insulation, it is called the insulation barrel. Wire and/or insulation barrels may be either 'open' or 'closed' in design. Closed barrels resemble a hollow cylinder into which the wire must be inserted. Open barrels are formed into an open 'U' and are common to most strip terminals manufactured by AMP Incorporated.",
    },
    {
      "id": 1,
      "word": "barrier block",
      "def":
          "An insulated mounting for terminal connections. Barrier blocks are available with threaded holes to accept threaded screws, or with threaded studs to accept fastening washers and nuts.",
    },
    {
      "id": 1,
      "word": "Barrier Height",
      "def":
          "The difference between the metal work function and the semiconductor electron affinity in a rectifying metal-semiconductor junction (see Schottky diode). The barrier height of a Schottky junction determines the voltage current characteristics of that diode. This can be important because it determines the local oscillator power necessary to bias the junction to its optimum non-linear operating point. As an approximation, the optimum local oscillator power will increase as the square of the barrier height, if the same mixer circuit characteristics and junction capacitance values are used.",
    },
    {
      "id": 1,
      "word": "base",
      "def":
          "(1) The region of a bipolar transistor that separates the emitter and collector regions. Majority carriers injected into the base from an external source controls the amount of current that flows in the emitter and collector regions. (2) An insulating support for the printed circuit pattern. It may be of flexible or rigid material.",
    },
    {
      "id": 1,
      "word": "Base Current",
      "def": "The current that flows into the base of a bipolar transistor.",
    },
    {
      "id": 1,
      "word": "base metal",
      "def":
          "Metal from which the product or accessory is made, and on which one or more platings or coatings may be deposited.",
    },
    {
      "id": 1,
      "word": "Base Plate",
      "def":
          "Substrate to which circuit components are mounted or, a metal plate to which the converter is attached. Normally used to draw heat away from critical circuit components. Also see Heat Sink.",
    },
    {
      "id": 1,
      "word": "Base Plate Temperature",
      "def":
          "Temperature of the case when the converter and surrounding system are operating normally. Often used as a specification for DC-DC converters with extended temperature ranges. Sometimes referred to as Case Temperature.",
    },
    {
      "id": 1,
      "word": "Base Resistance",
      "def":
          "The resistance of a PolySwitch device under specified conditions (e.g., 20?C), before connection into a circuit. Devices of a particular type will be delivered with a range of resistances; therefore, a minimum value, Rmin, and/or a maximum value, Rmax, are often given.",
    },
    {
      "id": 1,
      "word": "Base Transceiver Station (or Base Station)",
      "def":
          "A high power transceiver, typically located at the geometric center of a cell, which links subscriber radios such as cellular phones or modems to the landline communication infrastructure.",
    },
    {
      "id": 1,
      "word": "Baseband",
      "def":
          "Transmission scheme in which the entire bandwidth, or data-carrying capacity, of a medium (such as coaxial cable) is used to carry a single digital pulse, or a signal, between multiple users. Because digital signals are not modulated, only one kind of data can be transmitted at a time. Contrast with broadband.",
    },
    {
      "id": 1,
      "word": "baseband signal",
      "def":
          "A signal transmitted at its original frequency, without modulation.",
    },
    {
      "id": 1,
      "word": "BASIC",
      "def":
          "Beginners All-purpose Symbolic Instruction Code. A simple, procedural programming language, popular in timesharing and in microcomputers.",
    },
    {
      "id": 1,
      "word": "Basic Encoding Rate (BER)",
      "def": "Rule of encoding data units described in ANS.1.",
    },
    {
      "id": 1,
      "word": "Basic Rate Interface (BRI)",
      "def": "Reference ISDN.",
    },
    {
      "id": 1,
      "word": "Batch Number",
      "def": "Lot number",
    },
    {
      "id": 1,
      "word": "Battery Backup",
      "def":
          "Subsystem for electronic equipment that provides power in the event of input power loss. Battery backed systems are a common application are for DC-DC converters.",
    },
    {
      "id": 1,
      "word": "baud",
      "def":
          "A unit of signaling speed equal to the number of signal symbols per second, which may or may not be equal to the data rate in bits per second.",
    },
    {
      "id": 1,
      "word": "bayonet coupling",
      "def":
          "A quick coupling device for circular plug and receptacle connectors. Pins projecting from the outside of the cylindrical receptacle engage with corresponding cam slots in the bayonet plug. Mating is accomplished by rotation of the two parts under pressure.",
    },
    {
      "id": 1,
      "word": "bcd",
      "def":
          "binary coded decimal - A coding system in which each decimal digit from 0 to 9 is represented by four bits.",
    },
    {
      "id": 1,
      "word": "beam lead",
      "def":
          "(1) A metallized termination that extends beyond the edge of a semiconductor die. (2) A semiconductor die with metallized terminations that extend from the edges of the die. A beam lead device is mechanically and electrically attached to a circuit by means of these leads.",
    },
    {
      "id": 1,
      "word": "Beaming",
      "def": "Crosslinking by means of high-energy electrons.",
    },
    {
      "id": 1,
      "word": "Beamsplitter",
      "def":
          "An optical device, such as a partially reflecting mirror, that splits a beam of light into two or more beams and that can be used in fiber optics for directional couplers.",
    },
    {
      "id": 1,
      "word": "Bel",
      "def":
          "The common logarithm of the ratio of two amounts of power. The abbreviation for Bel is 'B.' If P1/P2 is the ratio of two powers, then this ratio expressed in Bels, N, is N = log10 (P1/P2).",
    },
    {
      "id": 1,
      "word": "bellmouth",
      "def":
          "Flared at the mouth. The rear of a properly crimped wire barrel will have a slight flare (bellmouth) to relieve the strain on the wire strands as they leave the area of high compression and take their natural 'lay.' Bellmouth may also be present on the front of the wire barrel.",
    },
    {
      "id": 1,
      "word": "Bend loss",
      "def":
          "A form of increased attenuation in a fiber that results from bending a fiber around a restrictive curvature (a macrobend) or from minute distortions in the fiber (microbends).",
    },
    {
      "id": 1,
      "word": "BER",
      "def":
          "Bit Error Rate - The ratio of the number of bits in a data transmission that are incorrectly received to the number of bits received. The BER is typically expressed in parts per million and is used as an indication of reliability.",
    },
    {
      "id": 1,
      "word": "bezel",
      "def":
          "The frame (usually plastic) that holds the keyboard together and provides for key mounting and a general framework.",
    },
    {
      "id": 1,
      "word": "B-H Curve",
      "def":
          "Curve to show characteristics of a magnetic material, in terms of magnetizing force (H) and resulting flux density.",
    },
    {
      "id": 1,
      "word": "BH Loop",
      "def":
          "A hysteresis loop showing magnetic characteristics of a magnetic material as an alternating current is applied.",
    },
    {
      "id": 1,
      "word": "BHMAX (Maximum Energy Product)",
      "def":
          "Indicates the maximum energy that a magnetic material can supply to an external magnetic circuit when operating at the Bd, Hd point on its demagnetization curve, measured in megaGauss-Oersteds (MGOe) or kiloJoules per cubic meter (kJ/m3).",
    },
    {
      "id": 1,
      "word": "Bias",
      "def":
          "The control voltage and/or current applied to a device that establishes or facilitates proper operation.",
    },
    {
      "id": 1,
      "word": "Bias Current",
      "def":
          "The (typically direct) current applied to an electronic device to control or facilitate its operation.",
    },
    {
      "id": 1,
      "word": "bias voltage",
      "def":
          "A voltage used to establish the desired dc operating voltage for a semiconductor. Generally refers to the base voltage.",
    },
    {
      "id": 1,
      "word": "BiCMOS",
      "def":
          "A silicon process for fabricating integrated circuits that combine bipolar transistors and complementary metal oxide semiconductor devices on the same chip. The bipolar transistors provide high speed and can drive loads external to the IC, while the CMOS devices provide very high density and low power dissipation. Devices or IC's that use this process.",
    },
    {
      "id": 1,
      "word": "Bifilar Winding",
      "def": "Two strands of magnet wire wound side-by-side.",
    },
    {
      "id": 1,
      "word": "bifurcated contact",
      "def":
          "A spring contact that has been split lengthwise to provide two independent contact surfaces. This redundancy assures two points of contact with the mating conductor element.",
    },
    {
      "id": 1,
      "word": "Bilateral",
      "def":
          "A circuit or component whose operation is unchanged when the input and output ports are interchanged",
    },
    {
      "id": 1,
      "word": "binary",
      "def": "The binary number system has only two digits - 0 and 1.",
    },
    {
      "id": 1,
      "word": "binary code",
      "def":
          "A code in which each element may be either of two distinct values (eg the presence or absence of a pulse).",
    },
    {
      "id": 1,
      "word": "binary coded decimal",
      "def":
          "A coding system in which each decimal digit from 0 to 9 is represented by four bits.",
    },
    {
      "id": 1,
      "word": "Binder",
      "def":
          "A spiral wrapping of a thread to hold together the members of a cable.",
    },
    {
      "id": 1,
      "word": "bipolar",
      "def":
          "(1)Of or pertaining to two opposite polarities. (2) A semiconductor having at least two pn junctions and working through both minority and majority carriers (holes and electrons). Npn and pnp transistors, and related ICs such as TTL and ECL, are bipolar.",
    },
    {
      "id": 1,
      "word": "Birmingham Wire Gauge",
      "def":
          "BWG - The Birmingham Wire Gauge was used extensively in Great Britain and the United States for many years, but is now obsolete. Its uses have persisted, however, for certain purposes including galvanized steel wire for cable armor.",
    },
    {
      "id": 1,
      "word": "bistable",
      "def":
          "Having two stable electrical states. A bistable circuit will remain in either state indefinitely, until an external signal switches it to the other state. A flip-flop is an example of a circuit with this property.",
    },
    {
      "id": 1,
      "word": "bit",
      "def":
          "The smallest element of information in binary language. A contraction of Binary digit. These characters in system language signify 'on' and 'off' (1 and 0). Word length, memory capacity, etc, can be expressed in number of bits.",
    },
    {
      "id": 1,
      "word": "bit density",
      "def":
          "Number of bits that can be placed, per unit area or volume, on a storage medium (eg bits per inch of magnetic tape).",
    },
    {
      "id": 1,
      "word": "Bit Error Rate",
      "def":
          "BER - The ratio of the number of bits in a data transmission that are incorrectly received to the number of bits received. The BER is typically expressed in parts per million and is used as an indication of reliability.",
    },
    {
      "id": 1,
      "word": "Bits Per Second (bps)",
      "def":
          "The number of bits passing a point every second. The transmission rate for digital information.",
    },
    {
      "id": 1,
      "word": "black box",
      "def":
          "A term used loosely to refer to any assembly or subassembly, usually electronic, that can readily be installed or removed from a specific location in a larger system by an operator not familiar with its detailed internal structure.",
    },
    {
      "id": 1,
      "word": "BLEC",
      "def": "building local exchange carrier",
    },
    {
      "id": 1,
      "word": "blistering",
      "def":
          "A localized swelling and separation between any of the layers of the printed circuit base laminate and/or between the laminate and the metal cladding. Also, similar swelling in molded parts.",
    },
    {
      "id": 1,
      "word": "block",
      "def":
          "(1) Typically a contact housing used in a modular connector (2) A group of words or characters considered or transported as a unit, particularly with reference to input and output.",
    },
    {
      "id": 1,
      "word": "blocking",
      "def":
          "The sticking together of insulated wires; usually caused by heat.",
    },
    {
      "id": 1,
      "word": "Bluetooth",
      "def":
          "A transmission standard operating at 2.4 GHz for connecting telephones, computers and other devices without the use of wires.",
    },
    {
      "id": 1,
      "word": "BNC",
      "def": "A bayonet style coaxial connector.",
    },
    {
      "id": 1,
      "word": "BNC Series",
      "def":
          "A radio frequency connector covered by Military Specification. It has an impedance of 50 ohms, and is designed to operate in the 0 to 4 GHz frequency range. Quick connect/disconnect is featured by a pin and cam bayonet coupling.",
    },
    {
      "id": 1,
      "word": "bobbin",
      "def":
          "A part having one or more flanges connected to a barrel in a spool configuration. It may be any one of a number of round, square, oval, or rectangular configurations on which magnet wire is spirally wound into a coil.",
    },
    {
      "id": 1,
      "word": "bobbin core",
      "def":
          "A core with the shape of a bobbin or spool which contains flanges. Bobbin cores are available with and without leads and in the axial and radial form.",
    },
    {
      "id": 1,
      "word": "body",
      "def":
          "(1) Main, or largest, portion of a connector, to which other portions are attached. (2) A protective covering of resilient material over any portion of a cable, wire termination, or termination assembly in addition to normal jacketing of insulation, to prevent entry of moisture. Also, a form for holding potting compound.",
    },
    {
      "id": 1,
      "word": "bond pull",
      "def":
          "A test used to determine the integrity of a wire bond, in which mechanical stress is applied to the wire in the direction that would pull it from the semiconductor bonding area. Bond pull tests can destroy the wire bond, in which case the wire is pulled until it breaks or pulls free from the bonding area, or nondestructive, in which case a fixed amount of force is applied to the wire.",
    },
    {
      "id": 1,
      "word": "bond strength",
      "def":
          "A measure of the stress required to separate a layer of material from the base to which it is bonded. It is measured in pounds per square inch of width (peel strength) obtained by peeling the layer, and in pounds per square inch (pull strength) obtained by a perpendicular pull applied to a surface of the layer. Often used to describe the adhesion of a printed circuit path to the basic board material.",
    },
    {
      "id": 1,
      "word": "bond wire",
      "def":
          "A conductive wire that connects a semiconductor die to an external circuit.",
    },
    {
      "id": 1,
      "word": "bonding",
      "def":
          "The very low resistance fusion of a conductive wire to a metallized area of a semiconductor die. For most RF/microwave semiconductors, the wire and the topmost layer of metal on the semiconductor die are very pure gold (Au).",
    },
    {
      "id": 1,
      "word": "bonding area",
      "def":
          "A metallized region on the top surface of semiconductor die by which electrical connection to an external circuit is made by means of a bond wire.",
    },
    {
      "id": 1,
      "word": "bonding pad",
      "def":
          "Metallized areas on the surface of a semiconductor device, wafer, or die, to which electrical leads may be connected or probes applied. Also referred to as bonding area.",
    },
    {
      "id": 1,
      "word": "bonding temperature",
      "def":
          "Temperature above which adhesive melts and flows sufficiently to form an adhesive bond between substrates.",
    },
    {
      "id": 1,
      "word": "Boolean algebra",
      "def":
          "The algebra of logic named for George Boole. Similar in form to ordinary algebra, but with classes, propositions, yes/no criteria, etc for variables rather than numeric quantities. It includes the operators AND, OR, NOT, IF, EXCEPT, THEN.",
    },
    {
      "id": 1,
      "word": "boost regulator",
      "def":
          "A basic DC-DC switching converter topology that takes an unregulated input voltage and produces a higher regulated output voltage. The higher output voltage is achieved by storing energy in an input inductor and then transferring the energy to the output by turning a shunt switch (transistor) on and off at a fast rate.",
    },
    {
      "id": 1,
      "word": "boot",
      "def":
          "(1) Protective covering over any portion of a cable, wire, or connector in addition to the normal jacketing or insulation. (2) A form placed around wire termination of a multiplecontact connector to contain the liquid potting compound before it hardens. (3) A protective housing usually made from a resilient material to prevent entry of moisture into a connector.",
    },
    {
      "id": 1,
      "word": "bootstrap",
      "def":
          "(1) A feedback technique which tends to improve linearity and input impedance of circuits operating over a wide range of input signal. (2) A short sequence of instructions, usually a loader program, which entered into the computer's programmable memory will operate a bulk storage memory device to load the programmable memory with a larger, more sophisticated program.",
    },
    {
      "id": 1,
      "word": "bounce time",
      "def":
          "The time interval between when the contact first makes, and when the last contact make occurs.",
    },
    {
      "id": 1,
      "word": "BPF",
      "def":
          "Band Pass Filter - A reactive circuit which rejects signals whose frequencies are outside of its passband dB point frequencies and propagates signals whose frequencies are within the dB point frequencies.",
    },
    {
      "id": 1,
      "word": "bpi",
      "def": "Bits per inch - measurement of bit density",
    },
    {
      "id": 1,
      "word": "BPSK",
      "def": "Binary Phase Shift Key modulation.",
    },
    {
      "id": 1,
      "word": "braid",
      "def":
          "A woven metallic or fiber layer used as a shield covering for an insulated conductor or group of insulated conductors. When flattened, a metal weave may be used as a grounding strap.",
    },
    {
      "id": 1,
      "word": "Braid Angle",
      "def": "The angle between the braid strands and the axis of the cable.",
    },
    {
      "id": 1,
      "word": "branched",
      "def":
          "Chemistry term referring to side chains attached to original chain (in a direction different from that of the original chain) in molecular structure of polymers.",
    },
    {
      "id": 1,
      "word": "breadboard",
      "def":
          "A test board on which components are mounted to test the feasibility of prototype circuitry.",
    },
    {
      "id": 1,
      "word": "breadboard circuit",
      "def":
          "A circuit simulation using discrete components or partially integrated components to prove feasibility of a circuit.",
    },
    {
      "id": 1,
      "word": "breakdown voltage",
      "def":
          "(1)The voltage at which an insulator or dielectric ruptures, or at which ionization and conduction take place in a gas or vapor. (2) The reverse voltage at which avalanche breakdown occurs in a semiconductor. (3) Maximum AC or DC voltage that can be applied from the input to output (or chassis) of a converter without causing damage.",
    },
    {
      "id": 1,
      "word": "Breakout",
      "def":
          "A region in a harness assembly where a wire or a group of wires is detached to form a separate, terminated branch. Also known as a transition.",
    },
    {
      "id": 1,
      "word": "Breakover Current",
      "def": "Instantaneous current flowing at the breakover voltage, VBO.",
    },
    {
      "id": 1,
      "word": "Breakover Voltage",
      "def":
          "Maximum voltage across a SiBar device at breakdown measured under a specified voltage rate of rise and current rate of rise.",
    },
    {
      "id": 1,
      "word": "breakpoint",
      "def":
          "A point of special interest in a computer routine requiring human communication prior to continuation.",
    },
    {
      "id": 1,
      "word": "BRF",
      "def":
          "Band Reject Filter - A reactive circuit that rejects signals whose frequencies are within its 3 dB point frequencies and propagates signals whose frequencies are outside its 3 dB point frequencies.",
    },
    {
      "id": 1,
      "word": "bridge converter",
      "def":
          "Switching converter topology that employs four switching elements (full bridge) or two switching elements (half-bridge). This topology is more often used in off-line supplies rather than DC-DC converters. Bridge converters provide high output power and low ripple, but are significantly more complex than other types of converter topologies and thus are more expensive and prone to failure. Also see Boost Regulator, Buck Regulator, Flyback Converter, Foward Converter, Push-Pull Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "bridge/router",
      "def":
          "A device that can provide the function of a bridge, router or both concurrently. Bridge/router can route one or more protocols, such as TCP/IP and/or XNS, and bridge all other traffic.",
    },
    {
      "id": 1,
      "word": "bridging",
      "def":
          "The act of connecting a (typically) high input impedance device in shunt across a transmission line or signal path to monitor or sample a signal.",
    },
    {
      "id": 1,
      "word": "British Standard Wire Gauge",
      "def":
          "A modification of the Birmingham Wire Gauge and the legal standard of Great Britain for all wires. It is variously known as Standard Wire Gauge (SWG), New British Standard (NBS), English Legal Standard, and Imperial Wire Gauge.",
    },
    {
      "id": 1,
      "word": "brittle temperature",
      "def":
          "The temperature below which a material becomes brittle, often measured by a cold impact test.",
    },
    {
      "id": 1,
      "word": "broadband",
      "def":
          "Data transmission at a high rate, generally greater than T1 speeds (1.5 Mbps). This allows the transmission of voice, data and video signals over a single medium.",
    },
    {
      "id": 1,
      "word": "broadband EMI",
      "def":
          "Interference generated over a wide range of frequencies. For example, automotive ignition noise.",
    },
    {
      "id": 1,
      "word": "broadband signal",
      "def":
          "A signal transmitted by being impressed on a higher frequency carrier wave.",
    },
    {
      "id": 1,
      "word": "brush",
      "def":
          "A conductor, usually composed in part of some form of the element carbon, serving to maintain an electrical connection between stationary and moving parts of a motor or apparatus.",
    },
    {
      "id": 1,
      "word": "BSP",
      "def": "broadband service provider",
    },
    {
      "id": 1,
      "word": "BTS",
      "def":
          "Base transceiver station, or cellular base station for a wireless telephone system.",
    },
    {
      "id": 1,
      "word": "bubble",
      "def":
          "A raised protrusion of nonconductive film with a contact printed on the underside to provide, in most cases, tactile feel.",
    },
    {
      "id": 1,
      "word": "bubble memory",
      "def":
          "A serialaccess memory offering very dense storage. Bits are stored as tiny, movable magnetic domains that are circulated through a thin film of magnetic garnet crystal fabricated similar to an IC. Packaging is similar to a DIP.",
    },
    {
      "id": 1,
      "word": "buck boost converter",
      "def":
          "Also called a 'flyback' converter, this topology typically uses a single transistor switch and eliminates the need for an output inductor. Energy is stored in the transformer primary during the first half of the switching period when the transistor switch is on. During the second half or 'flyback' period when the transistor is off, this energy is tranferred the transformer secondary and load. Also see Boost Regulator, Buck Regulator, Bridge Converter, Forward Converter, Push-Pull Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "buck derived converter",
      "def":
          "Also called a 'foward' converter, this topology, like the flyback converter, typically uses a single transistor switch. Unlike the flyback converter, energy is tranferred to the transformer secondary while the transistor switch is 'on', and stoed in a output inductor. See Boost Regulator, Buck Regulator, Bridge Converter, Flyback Converter, Push Pull Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "buck regulator",
      "def":
          "A basic DC-DC switching converter topology that takes an unregulated input voltage and produces a lower regulated output voltage. The lower output voltage is achieved by chopping the input voltage with a series connected switch (transistor) which applies pulses to an averaging inductor and capacitor.",
    },
    {
      "id": 1,
      "word": "buffer",
      "def":
          "(1) A protective layer over the fiber, such as a coating, an inner jacket, or a hard tube. (2) A device which stores information temporarily during data transfers. Often used to isolate one part of a circuit from another.",
    },
    {
      "id": 1,
      "word": "buffer coating",
      "def":
          "A protective layer, such as an acrylic polymer, applied over the fiber cladding for protective purposes.",
    },
    {
      "id": 1,
      "word": "buffer tube",
      "def":
          "A hard plastic tube, having an inside diameter several times that of a fiber, that holds one or more fibers.",
    },
    {
      "id": 1,
      "word": "bulk storage memory",
      "def": "Any nonprogrammable large memory.",
    },
    {
      "id": 1,
      "word": "bulkhead",
      "def":
          "A term used to define a mounting style of connectors. Bulkhead connectors are designed to be inserted into a panel cutout from the rear (component side) of the panel.",
    },
    {
      "id": 1,
      "word": "buna rubber",
      "def": "See Nitrile-Butadiene Rubber and Styrene-Butadiene Rubber.",
    },
    {
      "id": 1,
      "word": "bunch stranding",
      "def":
          "A method of twisting individual strands to form a finished stranded conductor. Specifically, a number of strands twisted together in a common direction and with a uniform pitch (or twist) per inch.",
    },
    {
      "id": 1,
      "word": "burn in",
      "def":
          "Operation of a circuit or equipment to stabilize all components and reduce failure rates.",
    },
    {
      "id": 1,
      "word": "burnout",
      "def":
          "The failure mode in a device that is induced by excessive power dissipation in the device.",
    },
    {
      "id": 1,
      "word": "bus",
      "def":
          "(1) One or more conductor paths used to transmit information from any of several sources to any of several destinations. (2) - Uninsulated conductor (wire, bar, etc); may be solid or hollow, round or rectangular. Sometimes used to indicate bus bar.",
    },
    {
      "id": 1,
      "word": "bus bar",
      "def":
          "A heavy bar or strap (usually of copper) for carrying heavy currents, or serving as a common connection between several circuits.",
    },
    {
      "id": 1,
      "word": "bus network",
      "def":
          "A network topology in which nodes are all connected to a single line serving as the bus.",
    },
    {
      "id": 1,
      "word": "bus reactor",
      "def":
          "A current limiting reactor connected between two buses, or between two sections of one bus, to limit and localize any disturbance caused by either bus (or bus section).",
    },
    {
      "id": 1,
      "word": "bus-powered",
      "def":
          "Class of devices that derive their power from the main Hub. Examples include USB hubs, keyboards, mice, internet cameras.",
    },
    {
      "id": 1,
      "word": "butt",
      "def":
          "When two conductors are placed together end-to-end with their axes in line, but not overlapping.",
    },
    {
      "id": 1,
      "word": "butt gap",
      "def":
          "A gap, mostly found in E cores, that is obtained by equally spacing all mating surfaces of the core, usually by plastic shims or some other non-magnetic material. This is an alternative to center post gapping, where only the center leg of a core is gapped. To achieve the same gap electrically a center leg gap must be twice as much as a butt gap.",
    },
    {
      "id": 1,
      "word": "butt splice",
      "def":
          "A splice wherein two wires from opposite ends butt against each other, or against a stop, in the center of the splice.",
    },
    {
      "id": 1,
      "word": "bypass filter",
      "def":
          "A filter or capacitor that provides a lowimpedance path for high frequencies around a circuit element such as an integrated circuit.",
    },
    {
      "id": 1,
      "word": "byte",
      "def": "A unit of eight (8) bits.",
    },
    {
      "id": 1,
      "word": "'C' stage",
      "def":
          "The condition of a resin polymer when it is in the solid state, with high molecular weight, being insoluble and infusible.",
    },
    {
      "id": 1,
      "word": "C/A",
      "def": "Course/Acquisition (code)",
    },
    {
      "id": 1,
      "word": "cable",
      "def":
          "Either a stranded conductor with or without insulation and other coverings (singleconductor cable), or a combination of conductors insulated from one another (multipleconductor cable). In fiber optics, a jacketed fiber or jacketed bundle in a form which can be terminated.",
    },
    {
      "id": 1,
      "word": "cable assembly",
      "def": "A completed cable and its associated hardware.",
    },
    {
      "id": 1,
      "word": "cable clamp",
      "def":
          "A mechanical clamp attached to the cable side of a termination assembly to support the cable or wire bundle. It provides strain relief and absorbs vibration and shock that would otherwise be transmitted by the cable terminations.",
    },
    {
      "id": 1,
      "word": "cable clamp",
      "def":
          "A device used to give mechanical support to a wire bundle or cable.",
    },
    {
      "id": 1,
      "word": "cable clamp adapter",
      "def":
          "A mechanical adapter that attaches to the rear of a termination assembly to allow the attachment of a cable clamp.",
    },
    {
      "id": 1,
      "word": "cable modem",
      "def": "Modem designed for use on TV coaxial cable circuit.",
    },
    {
      "id": 1,
      "word": "cable sealing clamp",
      "def":
          "A device consisting of a gland nut designed to seal around the jacket of a cable.",
    },
    {
      "id": 1,
      "word": "cabler",
      "def":
          "A machine that mechanically assembles a group of insulated wires.",
    },
    {
      "id": 1,
      "word": "cabling",
      "def":
          "The act of twisting together two or more insulated components to form a cable.",
    },
    {
      "id": 1,
      "word": "CAD",
      "def":
          "Computer-aided design. Use of the computer in engineering design activities.",
    },
    {
      "id": 1,
      "word": "calender",
      "def":
          "Process in which film and sheet material is produced by squeezing heated, viscous material between two or more counter-rotating rolls.",
    },
    {
      "id": 1,
      "word": "CAM",
      "def":
          "Computer-aided manufacture. Use of computer to aid and direct manufacturing activities.",
    },
    {
      "id": 1,
      "word": "camber",
      "def":
          "The warpage of ceramic material substrates. It may be in any direction away from the absolute flat condition. Generally measured by passing the slab between two plates of metal, set for maximum allowable camber.",
    },
    {
      "id": 1,
      "word": "campus area network",
      "def":
          "A network which encompasses interconnectivity between floors of a building and/or buildings in a confined geographic area such as a campus or industrial park. Such networks would not require public rights-of-way and operate over fairly short distances.",
    },
    {
      "id": 1,
      "word": "Canadian Standards Association",
      "def":
          "CSA - Independent organization that establishes and tests safety standards for electronic components and systems for the Canadian marketplace.",
    },
    {
      "id": 1,
      "word": "CAP",
      "def":
          "Carrierless Amplitude Phase Modulation. A two-dimensional line code used in ADSL.",
    },
    {
      "id": 1,
      "word": "capacitance",
      "def":
          "(1) The property of conductors and dielectrics that permits storing electricity when a potential differences exists between conductors. The value of capacitance is expressed as the ratio of the electric charge to the voltage between the conductors. The unit of capacitance is the Farad (F). (2) The ability of an insulation to store electrical energy. This is a function of the permittivity (dielectric constant) of the insulation. Usually expressed in pico farads/foot for a cable.",
    },
    {
      "id": 1,
      "word": "capacitive coupling",
      "def":
          "The coupling of energy from one conductor to another as a result of the distributed capacitance between them.",
    },
    {
      "id": 1,
      "word": "capacitive decoupling",
      "def":
          "The establishment of AC ground or a low impedance point for AC signals at a point in a circuit as a result of the presence of capacitance between that point and ground.",
    },
    {
      "id": 1,
      "word": "capacitive reactance",
      "def":
          "The opposition to alternating current flow presented by a capacitance. The symbol for capacitive reactance is XC. The unit is the ohm. The formula for capacitive reactance is XC = 1/(2?fC), where f is the frequency of the alternating current signal, and C is the capacitance.",
    },
    {
      "id": 1,
      "word": "capacitor",
      "def":
          "A device - to store electricity and release it when needed - consisting of conducting plates or foils separated by thin layers of dielectric, the plates on opposite sides of the dielectric layers being oppositely charged by a source of voltage, and the electrical energy of the charged system being stored in the polarized dielectric. A capacitor will block direct current flow but will allow alternating current flow as determined by its capacitive reactance. Often used for filtering or DC blocking. The unit of capacitance is the Farad.",
    },
    {
      "id": 1,
      "word": "CAPs",
      "def":
          "Competitive Access Provider or Competitive Local Exchange Carrier. Alternative provider to Local Exchange Carrier.",
    },
    {
      "id": 1,
      "word": "Carbonyl Iron",
      "def":
          "A relatively expensive iron powder used in low permeability, high frequency powdered iron cores.",
    },
    {
      "id": 1,
      "word": "card image",
      "def":
          "The arrangement of information in memory resulting from computer read-out of a punched card, the information arrangement required for a computer output of a card. A card image is hardware dependent, varying from computer to computer.",
    },
    {
      "id": 1,
      "word": "carrier",
      "def":
          "(1) A group of strands or ends used to form a finished braid. (2) A higher frequency upon which voice or coded data can be superimposed (modulated).",
    },
    {
      "id": 1,
      "word": "carrier sense multiple access with collision detection",
      "def":
          "A technique used to control the transmission channel of a local area network to ensure that there is no conflict between terminals that wish to transmit.",
    },
    {
      "id": 1,
      "word": "carrier suppression",
      "def":
          "The degree to which the carrier signal is reduced in amplitude in a modulator or mixer. Carrier suppression is usually expressed in dB.",
    },
    {
      "id": 1,
      "word": "cascade",
      "def":
          "To take the output of one amplifier and apply it as the input signal to the second amplifier, and the output of the second to the third, and so on. Each amplifier is called a stage, and stages used successively are said to be in cascade.",
    },
    {
      "id": 1,
      "word": "case",
      "def": "enclosure",
    },
    {
      "id": 1,
      "word": "case temperature",
      "def":
          "Temperature of the case when the converter and surrounding system are operating normally. Often used as a specification for DC-DC converters with extended temperature ranges. Case temperature is at times referred to as a Base Plate Temperature.",
    },
    {
      "id": 1,
      "word": "catalyst",
      "def":
          "A substance which initiates and/or accelerates a chemical reaction but normally does not enter into the reaction.",
    },
    {
      "id": 1,
      "word": "catastrophic failure",
      "def":
          "The complete loss of a device's ability to perform its required function. Most commonly associated with failures that are sudden or involve rapid deterioration.",
    },
    {
      "id": 1,
      "word": "Category 3",
      "def":
          "A performance classification for twisted pair cables, connectors and systems.Specified to 16 MHz.Suitable for voice and data applications up to 10 Mbps.",
    },
    {
      "id": 1,
      "word": "Category 5",
      "def":
          "A performance classification for twisted pair cables, connectors and systems.Specified to 100 MHz.Suitable for voice and data applications up to 155 Mbps (possibly 1000 Mbps).",
    },
    {
      "id": 1,
      "word": "Category 5e",
      "def":
          "Also called Enhanced Category 5.A performance classification for twisted pair cables, connectors and systems.Specified to 100 MHz.Suitable for voice and data applications up to 1000 Mbps.",
    },
    {
      "id": 1,
      "word": "Category 6",
      "def":
          "A performance classification for twisted pair cables, connectors and systems.Specified up to 250 MHz.",
    },
    {
      "id": 1,
      "word": "cathode",
      "def":
          "(1) In a semiconductor diode, the terminal to which positive charge carriers flow internally and into which negative charge carriers enter from the external circuit. (2) In electron tubes, the electrode from which electrons are emitted into the inter-electrode space.",
    },
    {
      "id": 1,
      "word": "cathode-ray tube",
      "def":
          "The 'picture tube' found in television receivers, oscilloscopes, and computer and terminal displays.",
    },
    {
      "id": 1,
      "word": "CATV",
      "def": "Community antenna television (cable television)",
    },
    {
      "id": 1,
      "word": "cavity",
      "def":
          "A metallic enclosure in some types of tubes and circuits within which resonant fields may be excited at the microwave frequency to which the cavity is tuned. Usually referred to as a resonant cavity. (See also contact cavity).",
    },
    {
      "id": 1,
      "word": "CCD",
      "def":
          "Charge-coupled device. A volatile serial-access memory that stores bits as tiny packets of electric charge moving along the surface of a semiconductor chip.",
    },
    {
      "id": 1,
      "word": "CCITT",
      "def":
          "Consultative Committee for International Telegraph and Telephone- The former name of an international organization that develops communications standards such as Recommendation X.25. Now called ITU-T.",
    },
    {
      "id": 1,
      "word": "CDI",
      "def": "Course Deviation Indicator",
    },
    {
      "id": 1,
      "word": "CDMA",
      "def":
          "Code Division Multiple Access. A digital transmission technique based on direct sequence spread spectrum.",
    },
    {
      "id": 1,
      "word": "CDPD",
      "def": "Cellular Digital Packet Data.",
    },
    {
      "id": 1,
      "word": "cellular",
      "def":
          "A wireless phone system that uses a grid of 'cells', each managed by a base station. Often refers to such systems that operate in or around the 800 - 1,000 MHz band.",
    },
    {
      "id": 1,
      "word": "center fastener",
      "def":
          "A mechanical fastening device located in the center of mating connectors. Includes a threaded screw on one connector that engages a threaded bushing on the mating connector.",
    },
    {
      "id": 1,
      "word": "centi",
      "def": "A prefix that indicates a factor 10-2, abbreviated as 'c..'",
    },
    {
      "id": 1,
      "word": "central processing unit",
      "def":
          "Abbreviated CPU. The section of a computer that contains the arithmetic, logic, and control circuits. In some systems it may also include the memory unit and the operator's console. Also called main frame.",
    },
    {
      "id": 1,
      "word": "centro-symmetrical reflective optics",
      "def":
          "An optical technique in which a concave mirror is used to control coupling of light from one fiber to another.",
    },
    {
      "id": 1,
      "word": "ceramic",
      "def":
          "An insulating material having properties similar to those of glass, notably hermeticity. These inorganic compounds are subjected to heat processing and become vitrified into a solid form. The resultant products are used for film circuits and packaging materials in the form of ceramic substrates. In the RF/microwave industry, the most frequently used ceramic materials are alumina (Al2O3), aluminum nitride (Al3N4), and beryllia (BeO).",
    },
    {
      "id": 1,
      "word": "ceramic cores",
      "def":
          "One of the common materials used for inductor cores. Its main purpose is to provide a form for the coil. In some designs it also provides the structure to hold the terminals in place. Ceramic has a very low thermal coefficient of expansion, which allows for relatively high inductance stability over the operating temperature ranges. Ceramic has no magnetic properties. Thus, there is no increase in permeability due to the core material. Ceramic core inductors are often referred to as 'air core' inductors. Ceramic core inductors are most often used in high frequency applications where low inductance values, very low core losses, and high Q values are required.",
    },
    {
      "id": 1,
      "word": "ceramic-based microminiature circuitry",
      "def":
          "Microminiature circuitry printed on a ceramic substrate. Usually consists of combinations of resistive, capacitive, or conductive elements fired on a wafer-like piece of ceramic.",
    },
    {
      "id": 1,
      "word": "cermet",
      "def":
          "A mixture of materials used to produce high resistance conductors for thick and thin film circuits.",
    },
    {
      "id": 1,
      "word": "CFM",
      "def":
          "Cubic feet per minute, which is a measure of the volume of air flowing in a system.",
    },
    {
      "id": 1,
      "word": "CGI",
      "def": "Common Gateway Interface",
    },
    {
      "id": 1,
      "word": "chain length",
      "def": "In a linear polymer, the number of monomer structural units.",
    },
    {
      "id": 1,
      "word": "channel",
      "def":
          "(1) A frequency interval or frequency band assigned for communications. (2) A single path for transmitting electric signals, where the term 'path' may refer to separate frequencies or time slots.. (3) The conducting layer in an FET between the source and drain. (4) The entire horizontal cabling system: everything between the computer and the LAN hub in the telecom closet, excluding the equipment connections.",
    },
    {
      "id": 1,
      "word": "character",
      "def":
          "One of a set of elements which may be arranged in ordered groups to express information. Each character has two forms: (1) a man-intelligible form, the graphic, including the decimal digits 0-9, the letters A-Z, punctuation marks, and other formating and control symbols; and (2) its computer-intelligible form, the code, consisting of a group of binary bits. Codes have been defined using 5, 6, 7, and 8 bit groups.",
    },
    {
      "id": 1,
      "word": "characteristic impedance",
      "def":
          "The impedance of a transmission line that is independent of length. Also, the ratio of voltage to current at any point along a transmission line on which there are no standing waves.",
    },
    {
      "id": 1,
      "word": "chemical resistance",
      "def":
          "The ability of an insulation to withstand the presence of materials?such as acids, bases, water, salt water, and fuels?that can deteriorate the insulation, or that, if penetrable to the conductor, can cause dielectric loss of insulating qualities.",
    },
    {
      "id": 1,
      "word": "chemically deposited printed circuit",
      "def":
          "A printed circuit formed on an insulating base by chemical reaction, providing a conductive pattern.",
    },
    {
      "id": 1,
      "word": "chemically reduced printed circuit",
      "def":
          "A printed circuit formed by the chemical erosion (etching) of portions of the metallic surface of a metalclad insulative material.",
    },
    {
      "id": 1,
      "word": "Cheminax cables",
      "def": "Raychem?s registered trade name for coaxial cables.",
    },
    {
      "id": 1,
      "word": "chip",
      "def":
          "A single substrate on which all the active and passive circuit elements are fabricated by semiconductor manufacturing techniques. Its function can be simple or complex.",
    },
    {
      "id": 1,
      "word": "chip carrier",
      "def":
          "A square semiconductor package having leads on all four sides and on .040 or .050in. centerlines.",
    },
    {
      "id": 1,
      "word": "choke",
      "def":
          "An inductor which is intended to filter, or 'choke', out unwanted signals.",
    },
    {
      "id": 1,
      "word": "churn",
      "def":
          "A term used to describe turnover in subscribers of various media such as magazines, newspapers, cable, and videotex services. Churn is an important measures of a medium's success in holding on to customers after they have been signed up as subscribers.",
    },
    {
      "id": 1,
      "word": "circuit",
      "def":
          "1) A complete path through which electrons can flow from the negative terminal of a voltage source through a conductor and back to the positive terminal. 2) The interconnected combination of a number of elements or parts to accomplish a desired function (eg filter, oscillator, amplifier).",
    },
    {
      "id": 1,
      "word": "circuit element",
      "def": "A basic constituent of a circuit, exclusive of interconnection.",
    },
    {
      "id": 1,
      "word": "circuit speed",
      "def":
          "The time taken for a circuit to perform its function - from application of input to resulting output.",
    },
    {
      "id": 1,
      "word": "circuit switching",
      "def":
          "Switching systems in which a dedicated physical circuit path must exist between sender and receiver for the duration of the 'call'. Used heavily in the phone company network, circuit switching often is contrasted with contention and token passing as a channel-access method, and with message switching and packet switching as a switching technique.",
    },
    {
      "id": 1,
      "word": "Circuit-Switched Network",
      "def":
          "Network that establishes a physical circuit temporarily, until it receives a disconnect signal.",
    },
    {
      "id": 1,
      "word": "circular mil area",
      "def":
          "CMA - A unit of area equal to the area of a circle whose diameter is 1 mil (0.001 inch). Used chiefly in specifying cross-sectional areas of conductors. To obtain the number of circular mils in a round solid wire of a given diameter, express the diameter in mils then square it. The CMA formula for stranded conductor is to square the mil diameter of one strand then multiply by the number of strands.",
    },
    {
      "id": 1,
      "word": "circular mils (cm)",
      "def":
          "The cross sectional area of a circular conductor calculated as a square conductor (cm is the diameter squared). This is often used in power applications for current handling capability vs. temperature rise.",
    },
    {
      "id": 1,
      "word": "Circulator",
      "def":
          "A multiport device that propagates signals from one port to the adjacent port with low loss in one direction and with high loss in the opposite direction.",
    },
    {
      "id": 1,
      "word": "cladding",
      "def":
          "An outer layer on a fiber core which promotes total internal reflection of light and also serves as a protection medium.",
    },
    {
      "id": 1,
      "word": "Cladding mode",
      "def":
          "A mode confined to the cladding; a light ray that propagates in the cladding.",
    },
    {
      "id": 1,
      "word": "clear",
      "def":
          "To replace information in a storage device by zero (or blank, in some machines). Also frequently used as being synonymous with 'reset' - even in cases where neither memory nor counters are involved.",
    },
    {
      "id": 1,
      "word": "CLEC",
      "def":
          "A distributed system model of computing that brings computing power to the desktop, where users('clients') access resources from servers.",
    },
    {
      "id": 1,
      "word": "Client/Server",
      "def":
          "A distributed system model of computing that brings computing power to the desktop, where users('clients') access resources from servers.",
    },
    {
      "id": 1,
      "word": "clock",
      "def":
          "(1)The device in a digital system which provides the continuous train of pulses used to synchronize the transfer of data. Sometimes referred to as 'the heartbeat.' (2) Timing pulses used within a system or circuit to synchronize the operation of components. In a DC-DC converter, these pulses are used to synchronize operation of the PWM chips.",
    },
    {
      "id": 1,
      "word": "Clocking",
      "def":
          "The arrangement of connector inserts, jackscrews, polarizing pins, sockets, keys/keyways, or housing configurations to prevent the mismating or cross-mating of connectors. See also Polarization.",
    },
    {
      "id": 1,
      "word": "Close Magnetic Path",
      "def":
          "Magnetic core shapes designed to contain all of the magnetic flux generated from an excited winding(s). Inductors made with these core types are considered to be shielded inductors. Shielding, however, is a matter of degree. Common core shapes that are considered to have closed magnetic paths are toroids, E-cores, and most pot cores. Shielded bobbins also offer a high degree of shielding but most have an air gap to some degree. Common core shapes that are considered to have open magnetic flux paths are rod cores and unshielded bobbin cores.",
    },
    {
      "id": 1,
      "word": "closed barrel",
      "def":
          "The portion(s) of a terminal, splice, or contact that is crimped. When designed to receive the conductor, it is called the wire barrel. When designed to support or grip the insulation, it is called the insulation barrel. Wire and/or insulation barrels may be either 'open' or 'closed' in design. Closed barrels resemble a hollow cylinder into which the wire must be inserted. Open barrels are formed into an open 'U' and are common to most strip terminals manufactured by AMP Incorporated.",
    },
    {
      "id": 1,
      "word": "closed circuit",
      "def":
          "An electrical circuit through which current can flow, such as when a power switch is moved to the 'on' position. The opposite of an 'open' circuit.",
    },
    {
      "id": 1,
      "word": "closed end splice",
      "def":
          "An insulated splice in which two or more wires overlap and all enter the splice from the same end of the barrel.",
    },
    {
      "id": 1,
      "word": "closed entry contact",
      "def":
          "A female contact designed to prevent the entry of a pin or probing device having a crosssectional dimension (diameter) greater than the mating pin.",
    },
    {
      "id": 1,
      "word": "closed loop",
      "def":
          "A routine in which a group of instructions is repeated for an indefinite period.",
    },
    {
      "id": 1,
      "word": "Closed Magnetic Path",
      "def":
          "Magnetic core shapes designed to contain all of the magnetic flux generated from an excited winding(s). Inductors made with these core types are considered to be shielded inductors, although shielding is a matter of degree. Common core shapes that are considered to have closed magnetic paths are toroids, E-cores, and most pot cores. These core shapes do, however, contain minute air gaps that are unavoidable in manufacturing. Some common core shapes considered to have open magnetic flux paths are rod cores and unshielded bobbin cores.",
    },
    {
      "id": 1,
      "word": "CMA",
      "def":
          "Circular Mill Area - A unit of area equal to the area of a circle whose diameter is 1 mil (0.001 inch). Used chiefly in specifying cross-sectional areas of conductors. To obtain the number of circular mils in a round solid wire of a given diameter, express the diameter in mils then square it. The CMA formula for stranded conductor is to square the mil diameter of one strand then multiply by the number of strands.",
    },
    {
      "id": 1,
      "word": "CMG",
      "def": "Course Made Good",
    },
    {
      "id": 1,
      "word": "CMOS",
      "def":
          "Complementary-Metal-Oxide-Semiconductor - A popular MOS IC that uses both p-type and n-type material for the channels. This allows very dense packaging and low power consumption.",
    },
    {
      "id": 1,
      "word": "CMTS",
      "def": "cable modem termination system",
    },
    {
      "id": 1,
      "word": "CO",
      "def":
          "Central Office. A local telephone company office which connects to the main system where circuit switching of customer lines occurs.",
    },
    {
      "id": 1,
      "word": "coax",
      "def":
          "Short for coaxial. Single-conductor cables with braided shields. Used in the 80's for data transmission. Now generally replaced with UTP for data. Still used for video.",
    },
    {
      "id": 1,
      "word": "coaxial cable",
      "def":
          "A cylindrical transmission line structure consisting of a central conductor surrounded by a dielectric, which is in turn surrounded by a second, cylindrical conductor (called the shield or outer conductor). The cylinders subtended by center conductor, dielectric and outer conductor all share the same axis. The degree of flexibility in coaxial cables is indicated by the terms, flexible, semirigid, or rigid.",
    },
    {
      "id": 1,
      "word": "coaxial ribbon cable",
      "def":
          "Ribbon cable consisting of parallel coaxial conductors joined together in a flexible insulating material and designed for mass termination.",
    },
    {
      "id": 1,
      "word": "COBOL",
      "def":
          "COmmon Business Oriented Language. Used to express problems of data manipulation and processing in English narrative form.",
    },
    {
      "id": 1,
      "word": "Coder/Decoder (Codec)",
      "def":
          "Equipment to convert between analog and digital information format. Also may provide digital information format. Also, may provide digital compression functions.",
    },
    {
      "id": 1,
      "word": "coefficient of expansion",
      "def":
          "The fractional change in dimension of a material for a unit change in temperature.",
    },
    {
      "id": 1,
      "word": "Coercive Force (HC)",
      "def":
          "The value of magnetizing force required to reduce the flux density to zero.",
    },
    {
      "id": 1,
      "word": "COFDM",
      "def": "code orthogonal frequency-division multiplexing",
    },
    {
      "id": 1,
      "word": "co-fire",
      "def":
          "The process of placing the circuits onto an unfired ceramic, and firing the two (ie the circuits and ceramic) at the same time. Registration for this process is generally toward the center of the slab.",
    },
    {
      "id": 1,
      "word": "COG",
      "def": "Course Over Ground",
    },
    {
      "id": 1,
      "word": "coil",
      "def":
          "(1) Successive turns of insulated wire which create a magnetic field when an electric current is passed through the wire. (2) Another term for an 'inductor'.",
    },
    {
      "id": 1,
      "word": "Coil Hi-Pot",
      "def":
          "The minimum voltage which the relay coil terminals will isolate when the relay is properly mounted.",
    },
    {
      "id": 1,
      "word": "Coil Resistance",
      "def": "The DC resistance, in ohms, of the coil at 25?C.",
    },
    {
      "id": 1,
      "word": "Coils",
      "def": "Another name for inductors.",
    },
    {
      "id": 1,
      "word": "Cold Bend",
      "def":
          "A test conducted by wrapping tubing or cable around a mandrel or by bending it in an arc while at a low temperature.",
    },
    {
      "id": 1,
      "word": "cold flow",
      "def":
          "Permanent deformation of polymeric materials (insulation) at ambient temperature due to mechanical force or pressure (not due to heat softening).",
    },
    {
      "id": 1,
      "word": "Cold Impact",
      "def":
          "A test performed by subjecting a component to a specified impact during exposure to low temperature. It measures the brittleness of the material.",
    },
    {
      "id": 1,
      "word": "cold joint",
      "def":
          "A soldered joint made with insufficient heat; solder has not completely flowed and wet the substrate.",
    },
    {
      "id": 1,
      "word": "cold weld",
      "def":
          "A metallurgical bond. The joining of two metals (without an intermediate material) by the application of pressure only - without electrical current or elevated temperature.",
    },
    {
      "id": 1,
      "word": "cold work",
      "def":
          "Hardening and embrittlement of metal due to repeated flexing action.",
    },
    {
      "id": 1,
      "word": "Collector",
      "def":
          "The region of a bipolar transistor into which current flows from the base of the transistor under the influence of reverse bias across the two regions.",
    },
    {
      "id": 1,
      "word": "Collector Current",
      "def":
          "The current that flows through the collector of a bipolar transistor.",
    },
    {
      "id": 1,
      "word": "Color Code",
      "def":
          "A means of identifying cable components using solid colors or stripes. Also, the scheme that assigns a number from 0 to 9 for each of 10 colors.",
    },
    {
      "id": 1,
      "word": "color coding",
      "def":
          "The selective placement of color on a terminal or contact to aid in its identification and to assure proper selection of the correct wire size and crimping tool.",
    },
    {
      "id": 1,
      "word": "color concentrates",
      "def":
          "Pigmented resins with high percentages of pigment. They are mixed with unpigmented resins by the processor.",
    },
    {
      "id": 1,
      "word": "Color Stability",
      "def":
          "The time and temperature ranges within which the color of a material will remain within the specified color limit.",
    },
    {
      "id": 1,
      "word": "command",
      "def":
          "A pulse, signal, or set of signals initiating one step in the performance of a computer operation. See also instruction.",
    },
    {
      "id": 1,
      "word": "Common",
      "def":
          "Conductive path used as a return for two or more circuits. Common is often used interchangeably with ground, which is technically not correct unless it is connected to earth. Also see Ground.",
    },
    {
      "id": 1,
      "word": "Common Carrier",
      "def":
          "Licensed utility that provides communications services at government-regulated rates.",
    },
    {
      "id": 1,
      "word": "Common Mode Current",
      "def":
          "A current conduction mode in which currents, present in two or more conductors, are flowing in phase and with equal magnitude within the conductor.",
    },
    {
      "id": 1,
      "word": "Common Mode Filter (or Choke)",
      "def":
          "An often used type of EMI filter which is wound in such a way that the phasing of the conductors will present a high impedance to common mode current (or noise) while presenting a low impedance to the desired signal.",
    },
    {
      "id": 1,
      "word": "Common Mode Noise",
      "def":
          "Noise or electrical interference that is common to both electrical lines in relation to ground.",
    },
    {
      "id": 1,
      "word": "Common Mode Noise",
      "def":
          "Noise component that is common to both the converter output and return lines with respect to the input common.",
    },
    {
      "id": 1,
      "word": "Common Mode Type I",
      "def":
          "On a single phase Wye bus, the conduction mode in which phase, neutral, and ground currents are in phase. The return current path is through the ground plane and the case.",
    },
    {
      "id": 1,
      "word": "Common Mode Type II",
      "def":
          "On a single phase Wye bus, the conduction mode in which phase and neutral currents are in phase, but the green wire currents are the return path, thus 180? out of phase.",
    },
    {
      "id": 1,
      "word": "Common Mode Voltage",
      "def": "The voltage that drives directed common mode (noise) current.",
    },
    {
      "id": 1,
      "word": "common-mode EMI",
      "def":
          "Interference that appears between both signal leads and common reference plane (ground) and causes the potential of both sides of the transmission path to be changed simultaneously and by the same amount relative to ground.",
    },
    {
      "id": 1,
      "word": "common-mode impedance coupling",
      "def":
          "The coupling of energy from one circuit to another that results when two or more currents flow through a common impedance.",
    },
    {
      "id": 1,
      "word": "compiler",
      "def":
          "A computer program that converts a program in a high-level language such as FORTRAN or Pascal into machine language.",
    },
    {
      "id": 1,
      "word": "complement",
      "def":
          "The complement of a variable or function is the binary opposite of that variable or function. In binary, if the function is '1,' its complement will be '0.'",
    },
    {
      "id": 1,
      "word": "component",
      "def":
          "Any item used in conjunction with another item in its manufacture.",
    },
    {
      "id": 1,
      "word": "compound",
      "def": "Any material composed of more than one element type.",
    },
    {
      "id": 1,
      "word": "Compound Under Strands",
      "def":
          "CUS - A problem that occurs when loose stranding, or overheating during extrusion, allows compounds to get under individual strands of conductor.",
    },
    {
      "id": 1,
      "word": "Compression",
      "def":
          "(1) The reduction in expected output power from a device or network that results from saturation of the device as a result of increased input power to the device. (2) The process of eliminating redundancy in a stream of data to represent the data in a more compact manner without destroying the meaning or information contained in the data.",
    },
    {
      "id": 1,
      "word": "compression molding",
      "def":
          "A method of molding thermosets. Compound (usually preheated) is placed in an open mold, mold is closed, and heat and pressure applied until material is cured. Material melts and flows within the mold to take the shape of the finished part.",
    },
    {
      "id": 1,
      "word": "compression set",
      "def":
          "The amount of compression an elastomer retains. Expressed as a percentage of original dimensions.",
    },
    {
      "id": 1,
      "word": "computer",
      "def":
          "Any device capable of accepting information, applying prescribed processes to the information, and supplying the results of these processes.",
    },
    {
      "id": 1,
      "word": "computer, off-line",
      "def":
          "Auxiliary equipment used with a computing system which operates independently of the main processing equipment, so as not to hamper the computer speed. Typical off-line equipment includes punched-card, punched-paper-tape, and magnetic-tape units. Also, the computer is not actively monitoring or controlling a process.",
    },
    {
      "id": 1,
      "word": "computer, on-line",
      "def":
          "Major processing equipment of compatible computer speed which is directly connected to the main processing unit. Also, a computer that is actively monitoring or controlling a process.",
    },
    {
      "id": 1,
      "word": "Concentrator",
      "def":
          "Device that serves as a wiring hub in star-topology network. Sometimes refers to a device containing multiple modules of network equipment.",
    },
    {
      "id": 1,
      "word": "concentric",
      "def":
          "A central core surrounded by one or more layers of helically wound strands in a fixed round geometric arrangement. Different diameter circles with exactly the same center point.",
    },
    {
      "id": 1,
      "word": "Concentric Stranding",
      "def":
          "A method of stranding conductor. Specifically, the final conductor is built up in layers so that the inner diameter of a succeeding layer is always equal to the outer diameter of the underlying layer.",
    },
    {
      "id": 1,
      "word": "Concentricity",
      "def":
          "(1) Ratio (expressed as a percentage) of the thinnest to the heaviest wall thickness. Measured on expanded or recovered tubing, or wire insulation, or jacketing. (2) In a wire or cable, the measurement of the location of the center of the conductor with respect to the geometric center of the circular insulation.",
    },
    {
      "id": 1,
      "word": "Conditioned Analog Line",
      "def":
          "Analog line to which devices have been added to improve the electrical signal.",
    },
    {
      "id": 1,
      "word": "Conductance",
      "def":
          "The reciprocal of resistance. The unit of conductance is the siemens, abbreviated as 'S.' The unit of conductance was the 'mho,' which was once shown as an upside down capital omega.",
    },
    {
      "id": 1,
      "word": "Conduction Cooled",
      "def":
          "Cooling a converter via a solid material. Cools a power converter by adding a heat sink or attaching the module to the system chassis.",
    },
    {
      "id": 1,
      "word": "conductive composite",
      "def":
          "A material comprised of electrically conductive particles dispersed in a polymer binder.",
    },
    {
      "id": 1,
      "word": "conductive fillers",
      "def":
          "A conductive material added to a dielectric to make it conductive.",
    },
    {
      "id": 1,
      "word": "conductive pattern",
      "def":
          "The pattern formed from an electrically conductive material on an insulating base (eg the circuit paths on a printed circuit board).",
    },
    {
      "id": 1,
      "word": "conductive plastics",
      "def": "A plastic to which conductive fillers have been added.",
    },
    {
      "id": 1,
      "word": "Conductive Polymer",
      "def":
          "A dispersion of conductive particles in an insulating organic polymer.",
    },
    {
      "id": 1,
      "word": "Conductivity",
      "def":
          "The capability of a material to carry electrical current, usually expressed as a percentage of copper conductivity (copper being 100%). Specifically, the ratio of the current flow to the potential difference causing the flow. The reciprocal of resistance.",
    },
    {
      "id": 1,
      "word": "Conductor",
      "def": "A device or material through which current flows easily",
    },
    {
      "id": 1,
      "word": "Conductor Resistance",
      "def":
          "The resistance to flow of the electrical current along a conductor. Expressed in ohms/1000 feet. (Usually referenced to 20?C).",
    },
    {
      "id": 1,
      "word": "Conduit",
      "def": "A tubular raceway for holding wires or cables.",
    },
    {
      "id": 1,
      "word": "Configuration",
      "def": "Arrangement of contacts in a multiple-contact connector.",
    },
    {
      "id": 1,
      "word": "confined (C) crimp",
      "def":
          "A crimp that remains in the confines of the outside diameter of the original barrel. (See also confined crescent crimp).",
    },
    {
      "id": 1,
      "word": "confined crescent (CC) crimp",
      "def":
          "A crimp that remains within the confines of the outside diameter of the original barrel, and is usually identified by two crescent (moon) shaped forms on the top and bottom of the wire barrel crimp.",
    },
    {
      "id": 1,
      "word": "connector",
      "def":
          "A coupling device employed to connect conductors of one circuit with those of another circuit. Used to provide rapid connect/disconnect mating with a pc board, posts, or another connector. A housing becomes a connector when it contains the specified number of contacts (with conductors) to make it functional.",
    },
    {
      "id": 1,
      "word": "connector assembly",
      "def":
          "Includes more parts than just a housing and contacts. It usually consists of a housing (with contacts), or a shell (with modules or inserts and contacts), and the necessary hardware to hold the assembly together and/or make the assembly a functional connector.",
    },
    {
      "id": 1,
      "word": "Connector Classes",
      "def":
          "Categories based on shape, function, and smallest-size contact in a series.",
    },
    {
      "id": 1,
      "word": "Connector Insert",
      "def":
          "In connectors with metal shells, the part that holds contacts in proper arrangement while electrically insulating them from each other and from the shell.",
    },
    {
      "id": 1,
      "word": "Consolidation point",
      "def":
          "An interconnect device that allows the horizontal cable to be split into two parts.Used for zone cabling.",
    },
    {
      "id": 1,
      "word": "Contact",
      "def":
          "The element in a connector that makes the actual electrical connection. Also the parts of a connector that actually carry the electrical current, and are touched together or separated to control the flow.",
    },
    {
      "id": 1,
      "word": "contact alignment",
      "def": "See contact float.",
    },
    {
      "id": 1,
      "word": "contact area",
      "def":
          "When conductors, electrical contacts, and/or printed circuit boards are joined electrically, 'contact area' defines the actual amount of surface area through which current is free to pass from one to the other.",
    },
    {
      "id": 1,
      "word": "Contact Arrangement",
      "def":
          "All Kilovac relays are one of the following: single pole single throw (SPST); single pole double throw (SPDT); double pole double throw (DPDT); four pole double throw (4PDT)",
    },
    {
      "id": 1,
      "word": "contact bounce",
      "def":
          "The intermittent and undesired opening of closed contacts or closing of open contacts that occurs during relay operate and release times.",
    },
    {
      "id": 1,
      "word": "Contact Capacitance",
      "def":
          "Contact capacitance is measured either between open contacts or between contacts and ground. Measurements are made per MIL-STD-202, Method 305, at 1 kHz.",
    },
    {
      "id": 1,
      "word": "contact cavity",
      "def":
          "A defined hole in the connector insert or housing into which the contact must fit.",
    },
    {
      "id": 1,
      "word": "Contact Crimp",
      "def":
          "A contact whose rear portion is a hollow cylinder that accepts the conductor. A crimping tool is applied to swage or form the contact metal firmly against the conductor. Sometimes referred to as a solderless contact.",
    },
    {
      "id": 1,
      "word": "contact durability",
      "def":
          "The number of insertion and withdrawal cycles that a connector must be capable of withstanding while remaining within the performance levels of the applicable specification.",
    },
    {
      "id": 1,
      "word": "contact engaging and separating force",
      "def":
          "Force required to either engage or separate contacts - both in and out of the connector housing or insert. Values are generally established for maximum and minimum forces. Performance acceptance level vary per specification or customer requirements. Sometimes the forces are not only measured initially, but also after specified number of engagements and separations.",
    },
    {
      "id": 1,
      "word": "contact float",
      "def":
          "Defines the overall side play which contacts shall have within the contact cavity of a connector housing, to permit self-alignment of mating contacts. Sometimes referred to as contact alignment.",
    },
    {
      "id": 1,
      "word": "Contact Form",
      "def":
          "All Kilovac relays are one of the following: Form A: SPST-Normally Open; Form B: SPST-Normally Closed; Form C: SPDT; Form 2C: DPDT; Form 4C: 4PDT; Form P: SPST-Latching; Form R: SPDT-Latching; Form X: SPST-NO-Double Make; Form Y: SPST-NC-Double Break",
    },
    {
      "id": 1,
      "word": "contact inspection hole",
      "def":
          "A hole, perpendicular to the cylindrical rear portion of screw machine contacts, used to check the depth to which wire has been inserted into the wire barrel.",
    },
    {
      "id": 1,
      "word": "contact rating",
      "def":
          "The maximum specified voltage and current to be passed through a set of contacts.",
    },
    {
      "id": 1,
      "word": "contact resistance",
      "def":
          "(1) Measurement of electrical resistance of mated contacts when assembled in a connector under typical service use. Electrical resistance is determined by measuring from the rear of the contact area of one contact to the rear of the contact area of its mate (excluding both crimps) while carrying a specified test current. Overall contact resistance would be the wire to wire measurement. (2) In vacuum relays, the resistance of closed contacts is measured as voltage drop across contacts carrying 1 amp at 6 Vdc. Measurement is made in accordance with MIL-R-83725, SAE ARD 50031, or MIL-R-6106. In gas-filled relays, 1 amp at 28 Vdc is used to measure contact resistance. ?Kelvin? connections should be used to obtain accurate readings.",
    },
    {
      "id": 1,
      "word": "contact retention",
      "def":
          "Defines the minimum axial load in either direction which a contact must withstand while remaining firmly fixed in its normal position within the connector insert or housing.",
    },
    {
      "id": 1,
      "word": "contact shoulder",
      "def":
          "The flanged or enlarged portion of a contact that prevents it from being over inserted into the appropriate contact cavity. The shoulder may also contribute to proper orientation and stability with the connector housing.",
    },
    {
      "id": 1,
      "word": "contact size",
      "def":
          "Defines the largest wire size which is normally used with the specific contact. By control document dimensioning, it also defines the size of the engagement end of the pin contact.",
    },
    {
      "id": 1,
      "word": "contact spacing",
      "def":
          "The distance between the centers of contacts within a connector insert or housing.",
    },
    {
      "id": 1,
      "word": "contact spring",
      "def":
          "The spring placed inside a sockettype contact to force the pin into positive intimate contact. Various types are used - depending on the application - including: leaf, cantilever, napkin ring, squirrel cage, hyperbolic, and 'chinese finger' springs. All perform the function of wiping and establishing good contact.",
    },
    {
      "id": 1,
      "word": "contact wipe",
      "def":
          "The distance over which the mating contact surfaces are touching during engagement and separation. (See also wiping action).",
    },
    {
      "id": 1,
      "word": "contact, bellows",
      "def":
          "A contact in which a flat spring is folded to provide a uniform spring rate. AMP considers cantilever spring construction to be superior to bellows because the insertion forces of the cantilever are desirably less.",
    },
    {
      "id": 1,
      "word": "contact, two-piece",
      "def":
          "A contact made of two separate parts joined by swedging, brazing, or other means of fastening to form a single contact. While this provides the mechanical advantages of two metals, it also has the inherent electrical disadvantage of difference in conductivity.",
    },
    {
      "id": 1,
      "word": "contents",
      "def": "The information contained in any storage medium.",
    },
    {
      "id": 1,
      "word": "continuity",
      "def":
          "A continuous path for the flow of current in an electrical circuit.",
    },
    {
      "id": 1,
      "word": "Continuous Current",
      "def":
          "The maximum current that can be carried by the closed contacts of the relay for a sustained time period. This specification is determined by measuring the resis-tance heating effect on critical relay components and must be derated at RF frequencies.",
    },
    {
      "id": 1,
      "word": "Continuous Operating Temperature",
      "def":
          "Maximum temperature at which a component will maintain an acceptable lifetime performance, based on accelerated aging prediction.",
    },
    {
      "id": 1,
      "word": "Continuous Service",
      "def":
          "Conditions (time, temperature, environment) that describe the lifetime requirements of a component.",
    },
    {
      "id": 1,
      "word": "Continuous Shield",
      "def": "See six-sided shielding.",
    },
    {
      "id": 1,
      "word": "Continuous Wave",
      "def":
          "The state of operation in which there is no interruption of the presence of a signal. The succeeding cycles of a continuous wave are identical.",
    },
    {
      "id": 1,
      "word": "control unit",
      "def":
          "The portion of a computer which directs automatic operation, interprets computer instructions, and initiates the proper signals to the other computer circuits to execute instructions.",
    },
    {
      "id": 1,
      "word": "Control Winding",
      "def":
          "The winding on a mag amp or saturable reactor used to control the amount of magnetic energy the core will absorb before saturating.",
    },
    {
      "id": 1,
      "word": "controlled part",
      "def":
          "An item which requires the application of specialized manufacturing and/or procurement techniques.",
    },
    {
      "id": 1,
      "word": "controller",
      "def":
          "An instrument that holds a process or condition at a desired level or status as determined by comparison of the actual value with the desired value.",
    },
    {
      "id": 1,
      "word": "Convection Cooled",
      "def":
          "Cooling of a converter via the movement of air over the surface of its heat dissipating components. Free-air convection means that the natural movement of air (unassisted by a fan or blower) is sufficient to maintain a converter within specified operating limits.",
    },
    {
      "id": 1,
      "word": "Conversion Loss",
      "def":
          "The reduction of signal power as a result of the conversion from the signal frequency to the IF frequency by a down converting mixer. Since this is defined as a loss, a reduction in power is considered as a positive conversion loss. LC = (IF output power)/(signal input power). Conversion loss can also be expressed in dB: L (dB) = -10 log (PIF/ PRF). When referring to a mixer diode, conversion loss is the loss in an optimum single-ended mixer carefully designed to minimize losses in the RF and LO coupling networks. Conversion loss normally includes power transferred to the image frequency that is resistively terminated.",
    },
    {
      "id": 1,
      "word": "copolymer",
      "def":
          "A compound resulting from the polymerization of two different monomers.",
    },
    {
      "id": 1,
      "word": "Copper Loss",
      "def":
          "The power lost by current flowing through the winding. The power loss is equal to the square of the current (I) multiplied by the resistance (R) of the wire (I2R). This power loss is realized in the form of heat.",
    },
    {
      "id": 1,
      "word": "Copper Loss",
      "def":
          "The power lost by current flowing through the winding. The power loss is equal to the square of the current multiplied by the resistance of the wire (1^2*R). This power loss is transferred into heat.",
    },
    {
      "id": 1,
      "word": "CopperOptics",
      "def":
          "A PairGain trademark referring to the functionality of the company's xDSL technology. In essence, with PairGain xDSL products, users can achieve fiber optic-quality signal transmission over copper cable.",
    },
    {
      "id": 1,
      "word": "cordwood",
      "def":
          "The technique of producing modules by bundling parts as closely as possible and interconnecting them into circuits by welding or soldering leads together.",
    },
    {
      "id": 1,
      "word": "Core",
      "def":
          "(1) In cables, a component or assembly of components over which additional components, such as a shield or a sheath, are applied. (2) Inner wall of dual-wall heat-shrinkable tubing. (3) Magnetic material placed within and around a coil to provide a path of lower reluctance for magnetic flux. (4) The central, light-carrying part of an optical fiber; it has an index of refraction higher than that of the surrounding cladding.",
    },
    {
      "id": 1,
      "word": "Core Constant",
      "def":
          "The summation of the magnetic path length of each section of the magnetic circuit divided by the square of the corresponding magnetic area of the same section.",
    },
    {
      "id": 1,
      "word": "Core Losses",
      "def":
          "Core losses are caused by an altering magnetic field in the core material. The losses aer a function of the operating frequency and the total magnetic flux swing. The total core losses are made up of three main components: Hysteresis, eddy current and residual losses. These losses vary considerably from one magnetic material to another. Applications such as higher power and higher frequency switching regulators require careful core selection to yield the highest inductor performance by keeping the core losses to a minimum.",
    },
    {
      "id": 1,
      "word": "Core Saturation",
      "def":
          "The DC bias current flowing through an inductor which causes the inductance to drop by a specified amount from the initial zero DC bias inductance value. Common specified inductance drop percentages include 10% for ferrite cores and 20% for iron powder cores in energy storage applications. Also referred to as saturation current.",
    },
    {
      "id": 1,
      "word": "Corner Frequency",
      "def":
          "The frequency at which linear extrapolations of two contiguous sections of a device's or component's transfer function drop by 3 decibels.",
    },
    {
      "id": 1,
      "word": "corona",
      "def":
          "A discharge of electricity appearing as a bluish-purple glow on the surface of, and adjacent to, a conductor when the voltage gradient exceeds a certain critical value. It is due to the ionization of surrounding air by high voltage.",
    },
    {
      "id": 1,
      "word": "counter",
      "def":
          "A device which maintains a continuous count of the events or pulses which are sequenced through, received, or sent. The word 'counter' is sometimes used improperly as a synonym for scanner or multiplexer.",
    },
    {
      "id": 1,
      "word": "Coupler",
      "def":
          "A class of multiport components that directs the majority of an incident signal to the output port and the remainder of the signal to other ports.",
    },
    {
      "id": 1,
      "word": "Coupling Factor",
      "def":
          "The ratio of the input power of a coupler to the output power from the coupled port. Coupling factor is typically expressed in decibels (dB).",
    },
    {
      "id": 1,
      "word": "Coupling Ring",
      "def":
          "The portion of a plug that aids in the mating and demating of a plug and receptacle and holds the plug to the receptacle.",
    },
    {
      "id": 1,
      "word": "coupon",
      "def":
          "A specimen of a printed board, or of printed-board material, for testing purposes.",
    },
    {
      "id": 1,
      "word": "Cover, Electrical Connector",
      "def":
          "An item specifically designed to cover the mating end of a connector for mechanical and/or environmental protection. Also known as a dust cover.",
    },
    {
      "id": 1,
      "word": "Coverage",
      "def":
          "A calculated percentage that defines the completeness with which a braid or shield covers the surface of the underlying insulated conductor or conductors.",
    },
    {
      "id": 1,
      "word": "CPE",
      "def":
          "Customer Premises Equipment-Terminating equipment, such as terminals, phones, routers and modems, supplied by the phone company, installed at customer sites, and connected to the phone company network",
    },
    {
      "id": 1,
      "word": "CPU",
      "def":
          "Central Processing Unit - The section of a computer that contains the arithmetic, logic, and control circuits. In some systems it may also include the memory unit and the operator's console. Also called main frame.",
    },
    {
      "id": 1,
      "word": "creep",
      "def":
          "Any slow change in a dimension or characteristic when a constant stress is applied to a material over a given period of time. Also referred to as cold flow.",
    },
    {
      "id": 1,
      "word": "creepage",
      "def":
          "The conduction of electricity across the surface of a dielectric.",
    },
    {
      "id": 1,
      "word": "creepage path",
      "def":
          "The path across the surface of a dielectric between two conductors. Lengthening the creepage path reduces the possibility of arc damage or tracking.",
    },
    {
      "id": 1,
      "word": "crimp",
      "def":
          "The final configuration of a terminal barrel after the necessary compression forces have been applied to cause a functional union between the terminal barrel and wire.",
    },
    {
      "id": 1,
      "word": "crimp contact",
      "def":
          "An electrical terminal or contact having a wire barrel that has been formed or machined into a hollow cylinder or left to remain as an open 'U.' After a wire has been inserted, the barrel is swedged into a controlled form that will continue to exert pressure on the wire. A crimp contact is often referred to as a solderless contact.",
    },
    {
      "id": 1,
      "word": "crimp height",
      "def":
          "A top to bottom measurement of the crimped barrel, using a Crimp Height Comparator in the prescribed manner. Refer to Instruction Sheet IS 7424.",
    },
    {
      "id": 1,
      "word": "crimper",
      "def":
          "The term most commonly used within AMP to identify that part of the crimping die - usually the moving part - which indents or compresses the terminal barrel(s). Also called indenter.",
    },
    {
      "id": 1,
      "word": "crimping chamber",
      "def":
          "The area of a crimping tool in which a contact or terminal is crimped; the crimping enclosure formed by the mating of the anvil (nest) and crimper (indenter). When the dies or jaws are fully closed or bottomed, it is the crimping chamber that is checked with a go no-go plug gage to ensure that the crimp produced by the tooling satisfies the crimp height specification. See also die closure.",
    },
    {
      "id": 1,
      "word": "Crimping Die",
      "def": "Portion of the crimping tool that shapes the crimp.",
    },
    {
      "id": 1,
      "word": "crimping dies",
      "def":
          "A term most commonly used within AMP to identify the shaping tools that when moved toward each other, produce a certain desirable form to the barrel of the terminal or contact that has been placed between them. Crimping dies for open barrel terminals are usually referred to as 'crimper and anvil.' Die set components used to crimp closed barrel terminals of the loose-piece variety may be referred to as 'indenter and nest,' 'moving die and stationary die,' or 'male die and female die.' Die sets are sometimes also referred to as die inserts.",
    },
    {
      "id": 1,
      "word": "crimping head",
      "def":
          "Tooling containing jaws and linkage for use in pneumatic or hydraulic powered units to crimp loosepiece contacts/terminals that may be too large for hand tool applications.",
    },
    {
      "id": 1,
      "word": "crimping tool",
      "def":
          "A term most commonly used to identify a hand held mechanical device (hand crimping tool) that is used to crimp a contact, terminal, or splice.",
    },
    {
      "id": 1,
      "word": "Critical Rate of Rise of Off-State Voltage",
      "def":
          "Maximum voltage rate of rise that will not cause a SiBar device to turn on.",
    },
    {
      "id": 1,
      "word": "Critical Rate of Rise of On-State Current",
      "def":
          "Maximum current rate of rise a SiBar device can withstand without damage.",
    },
    {
      "id": 1,
      "word": "Cross connect (XC)",
      "def":
          "Connecting hardware used to patch between two groups of cables (horizontal to backbone, for example).AMP 110Connect XC.",
    },
    {
      "id": 1,
      "word": "cross crimp",
      "def":
          "A crimp that deforms the terminal by exerting pressure on the top and bottom of the terminal barrel without confining the sides. Usually identified by a raised crescent (moon) shaped form on the surface of the crimp.",
    },
    {
      "id": 1,
      "word": "Cross Regulation",
      "def":
          "For a multiple output converter, the change in voltage on one output (expressed as a percent) caused by a load change on another output.",
    },
    {
      "id": 1,
      "word": "cross-linked",
      "def":
          "Inter-molecular bonds between long chain thermoplastic polymers by chemical or electron bombardment means. The properties of the resulting thermosetting material are usually improved.",
    },
    {
      "id": 1,
      "word": "Crosslinking",
      "def":
          "The formation of bonds between molecular chains in a polymer by means of chemical catalyzation or electron bombardment. The properties of the resulting thermosetting material are usually improved.",
    },
    {
      "id": 1,
      "word": "Crosslinking by Irradiation",
      "def":
          "A method of crosslinking polymers that makes a nonflowing material. This generally improves the properties of the polymer.",
    },
    {
      "id": 1,
      "word": "crossover",
      "def":
          "The point at which two conductors - insulated from each other - cross.",
    },
    {
      "id": 1,
      "word": "crosstalk",
      "def":
          "A magnetic or electrostatic coupling which causes the unwanted transfer of energy from one circuit, called the disturbing circuit, to another circuit, called the disturbed circuit (eg, voice communication heard in a given circuit, but originating in an adjacent circuit).",
    },
    {
      "id": 1,
      "word": "Crowbar",
      "def":
          "Circuit that crowbars or rapidly shuts down a converters output if a preset voltage level is exceeded. The circuit places a low resistance shunt across the output when an overvoltage condition exists.",
    },
    {
      "id": 1,
      "word": "CRT",
      "def": "cathode-ray tube.",
    },
    {
      "id": 1,
      "word": "CRT display",
      "def":
          "A computer terminal presenting visual data readout on a cathode-ray tube.",
    },
    {
      "id": 1,
      "word": "crush crimp",
      "def":
          "A crimp used on small contacts with small wire sizes. The wire barrel is preformed with the tips flared outward. During the crimping process, the flared tips slide around the crimper until the wire barrel closes, and then, the tips fold down and away from the center seam.",
    },
    {
      "id": 1,
      "word": "Crystallinity",
      "def":
          "The portion of polymer chains that are ordered in a regular (as opposed to amorphous) structure or a crystal lattice. Crystallinity tends to improve mechanical properties and fluid resistance. Crystalline or semicrystalline materials have a well-defined melting point (shrink temperature) at which the structure becomes disordered and the polymer flows.",
    },
    {
      "id": 1,
      "word": "CSA",
      "def":
          "Canadian Standards Association. A nonprofit, independent organization which operates a listing service for electrical and electronic materials and equipment. The Canadian counterpart of the Underwriters Laboratories.",
    },
    {
      "id": 1,
      "word": "CSMA/CD",
      "def":
          "Carrier sense, multiple access, with collision detection. A technique used to allocate and control the communication channel of a local area network and ensure there is no conflict between nodes that wish to transmit.",
    },
    {
      "id": 1,
      "word": "CSR",
      "def": "Centro-symmetrical reflective optics.",
    },
    {
      "id": 1,
      "word": "CSU/DSU",
      "def":
          "Channel Service Unit/Data Service Unit- A digital interface unit that connects end user equipment to the local digital telephone loop.",
    },
    {
      "id": 1,
      "word": "Cuk Converter",
      "def":
          "Variation of the 'buck-boost' converter that produces very low output ripple. Used primarily in applications that do not require input/output isolation. Also see Flyback Converter.",
    },
    {
      "id": 1,
      "word": "cure",
      "def":
          "To change the physical properties of a material by chemical reaction, by the action of heat and catalysts, alone or in combination, with or without pressure.",
    },
    {
      "id": 1,
      "word": "Curie Temperature",
      "def":
          "The temperature at which a ferrite material loses its magnetic properties. The core's permeability typically increases dramatically as the core temperature approaches the curie temperature, which causes the inductance to increase. The permeability drops to near unity at the curie temperature, which causes the inductance to drop dramatically. The curie point is the temperature at which the initial permeability (?i) has dropped to 10% of its value at room temperature.",
    },
    {
      "id": 1,
      "word": "Curing",
      "def":
          "Application of heat to thermoset material to harden or set the material; once set, cannot be resoftened by heating.",
    },
    {
      "id": 1,
      "word": "curing agents",
      "def":
          "Agents added to accelerate the reaction or curing of thermosetting plastics. They act as catalysts; ie, they do not react directly with the polymer in the polymerization. Crosslinking agents are distinguished from catalysts because they react with molecules and are coupled directly into the cured system as a structural member of the polymer.",
    },
    {
      "id": 1,
      "word": "curing cycle",
      "def": "The time, temperature, and pressure required for curing.",
    },
    {
      "id": 1,
      "word": "current",
      "def":
          "The rate of transfer of electricity from one point to another. Current is usually a movement of electrons but may also be a movement of positive ions, negative ions, or holes. Current is measured in amperes, milliamperes, and microamperes.",
    },
    {
      "id": 1,
      "word": "Current Density",
      "def":
          "The amperes per unit of cross section in the conductor. This is commonly measured in circular mils per amp (cm/a).",
    },
    {
      "id": 1,
      "word": "Current Foldback",
      "def": "See foldback current limiting.",
    },
    {
      "id": 1,
      "word": "current gain",
      "def":
          "In a transistor, the ratio of output to input current under specified conditions.",
    },
    {
      "id": 1,
      "word": "Current Limit",
      "def":
          "Maximum steady-state current level at which the power switch output is regulated in response to an overcurrent fault.",
    },
    {
      "id": 1,
      "word": "Current Limit Knee",
      "def":
          "On a plot of output voltage vs current, the point at which current begins to limit (or foldback).",
    },
    {
      "id": 1,
      "word": "Current Limiting",
      "def":
          "Feature that protects the converter (or load) from damage under overload conditions. The maximum converter output current is automatically limited to a predetermined safe value. If the converter is specified for auto restart, normal operatoin is automatically restored when overload condition is removed.",
    },
    {
      "id": 1,
      "word": "Current Mode Control",
      "def":
          "Control method used with switching converter topologies. A dual loop control circuit adjusts the PWM operation in response to a measured output current.",
    },
    {
      "id": 1,
      "word": "Current Rating",
      "def":
          "The maximum continuous electrical flow of current for which a device is designed to conduct for a specified time at a specified operation temperature. Usually expressed in amperes.",
    },
    {
      "id": 1,
      "word": "Current Transformer",
      "def":
          "Usually used in a sensing device, current transformers customarily have a one turn primary. The number of secondary turns is determined by the sensitivity required and is terminated with a resistor. Toroidal in shape, cores of silicon steel, nickel alloy, or ferrite are used. Choice of core material influences cost and accuracy.",
    },
    {
      "id": 1,
      "word": "Current,Hold",
      "def":
          "The largest steady state current that, under specified ambient conditions, can be passed through a PolySwitch device without causing the device to trip. For SiBar devices, the current at which the device resets to a high-impedance state once the surge current dissipates. See also Hold Current.",
    },
    {
      "id": 1,
      "word": "Current,Maximum Interrupt",
      "def":
          "The highest fault current that can safely be used to trip a PolySwitch device under specified conditions. Typically the lower the voltage dropped across the PolySwitch device in its tripped state, the higher the maximum interrupt current. Maximum interrupt currents are usually shown in this Databook at the maximum voltage. It may be possible to use a PolySwitch device at a higher interrupt current, but each such use must be individually qualified.",
    },
    {
      "id": 1,
      "word": "Current,Normal Operating",
      "def":
          "The highest steady state current that is expected to flow in a circuit under normal operating conditions. At the maximum ambient operating temperature of the circuit, the hold current of a PolySwitch device used to protect the circuit is typically greater than the normal operating current.",
    },
    {
      "id": 1,
      "word": "Current,Operating Range",
      "def":
          "The range of normal operating currents in a circuit containing a PolySwitch device. Typically the hold current of the PolySwitch device should be greater than the top of the operating current range.",
    },
    {
      "id": 1,
      "word": "Current,Trip",
      "def":
          "The smallest steady state current that, if passed through a PolySwitch device, will cause the device to trip, under specified conditions.",
    },
    {
      "id": 1,
      "word": "Current-carrying Capacity",
      "def":
          "The maximum current an insulated conductor is capable of carrying without exceeding its insulationand /or jacket-temperature limitations under specified ambient conditions. Also known as ampacity.",
    },
    {
      "id": 1,
      "word": "current-mode logic",
      "def":
          "CML - A bipolar logic family that works by diverting current from one path to another, rather than by switching transistors on and off. Characterized by very fast operating speeds and high power dissipation. Also called emitter current logic (EML).",
    },
    {
      "id": 1,
      "word": "CUS",
      "def":
          "Compound Under Strands - A problem that occurs when loose stranding, or overheating during extrusion, allows compounds to get under individual strands of conductor.",
    },
    {
      "id": 1,
      "word": "cutoff frequency",
      "def":
          "fc - The frequency at which the filter provides 3 dB of loss (1/2 power).",
    },
    {
      "id": 1,
      "word": "cutoff tab",
      "def":
          "On strip terminals, the projection which results when the point-of-shear is not flush with the terminal body.",
    },
    {
      "id": 1,
      "word": "Cutoff wavelength",
      "def":
          "For a single-mode fiber, the wavelength above which the fiber exhibits single-mode operation.",
    },
    {
      "id": 1,
      "word": "Cutout",
      "def":
          "The hole, usually round or rectangular, cut into a metal panel in order to mount a connector. The cutout may also include holes for mounting screws or bolts.",
    },
    {
      "id": 1,
      "word": "Cut-through Resistance",
      "def":
          "Resistance of solid material to penetration by an object (typically a closely controlled knife edge) under conditions of pressure, temperature, and other elements.",
    },
    {
      "id": 1,
      "word": "CW",
      "def":
          "Continuous Waves - The state of operation in which there is no interruption of the presence of a signal. The succeeding cycles of a continuous wave are identical.",
    },
    {
      "id": 1,
      "word": "cycle",
      "def":
          "One complete sequence of values of an alternating quantity, including a rise to maximum in One direction, and return to zero, a rise to maximum in the opposite direction, and return to zero. the number of cycles occurring in One second is called the frequency.",
    },
    {
      "id": 1,
      "word": "D Channel",
      "def":
          "Full duplex 16 kbps (basic rate) or 64 kbps (primary rate) ISDN channel.",
    },
    {
      "id": 1,
      "word": "D-AMPS",
      "def":
          "Digital Advanced Mobile Phone System. An American standard for digital mobile telephony used primarily in North America, Latin America, Australia and parts of Russia and Asia, now commonly referred to as TDMA.",
    },
    {
      "id": 1,
      "word": "Dark current",
      "def":
          "The thermally induced current that exists in a photodiode in the absence of incident optical power.",
    },
    {
      "id": 1,
      "word": "Data Circuit-terminating Equipment",
      "def":
          "Equipment that resides at the customer end of a transmission link and provides all necessary termination function for that link. May be owned by the customer or by the service provider.",
    },
    {
      "id": 1,
      "word": "Data rate",
      "def":
          "The number of bits of information in a transmission system, expressed in bits per second (bps), and which may or may not be equal to the signal or baud rate.",
    },
    {
      "id": 1,
      "word": "Data rate",
      "def":
          "The speed, measured in bits per second, that a particular network (or other application) transmits data.",
    },
    {
      "id": 1,
      "word": "Data Terminal Equipment (DTE)",
      "def":
          "The part of a data station that serves as a data source, destination, or both, and that provides for the data communications control function according to protocol. DTE includes computers, protocol translators, and multiplexers.",
    },
    {
      "id": 1,
      "word": "dB",
      "def":
          "Abbreviation for decibel.The logarithmic ratio of two powers, voltages or currents.",
    },
    {
      "id": 1,
      "word": "dBm",
      "def":
          "An abbreviation for decibels referred to one milliwatt. A term used to denote power level; i.e. 0 dBm is equal to 1 milliwatt.",
    },
    {
      "id": 1,
      "word": "DBS",
      "def": "direct broadcast satellite",
    },
    {
      "id": 1,
      "word": "dbtt",
      "def": "Decibel referenced to a microwatt.",
    },
    {
      "id": 1,
      "word": "DC",
      "def":
          "Direct Current - A flow of charge carriers within a medium in a single direction.",
    },
    {
      "id": 1,
      "word": "DC Bias",
      "def":
          "Direct current (DC) applied to the winding of a core in addition to any time-varying current. Inductance with DC bias is a common specification for powder cores. The inductance will 'roll off' gradually and predictably with increasing DC bias.",
    },
    {
      "id": 1,
      "word": "DC Filter",
      "def":
          "A filter circuit that removes the AC ripple from a mostly DC current. Usually this is done by using an inductor and capacitor together.",
    },
    {
      "id": 1,
      "word": "DC Stress",
      "def":
          "Annealing a magnetic material in the presence of a DC magnetic field to enhance magnetic properties.",
    },
    {
      "id": 1,
      "word": "DC-DC Converter",
      "def":
          "A circuit or device that converts a DC input voltage (usually unregulated) to a regulated DC output voltage. The output voltage may be lower, higher, or the same as the input voltage. Switching regulator DC-DC circuits most often require an inductor or transformer to achieve the regulated output voltage. Switching regulator circuits can achieve a higher level of power efficiency when compared to non-switching techniques.",
    },
    {
      "id": 1,
      "word": "DCE",
      "def":
          "Data Communications Equipment(EIA expansion) or Data Circuit-Terminating Equipment (CCITT expansion)- The devices and connections of a communications cicuit with the end device (data terminal equipment). A modem can be considered a DCE.",
    },
    {
      "id": 1,
      "word": "DCR",
      "def":
          "Direct Current Resistance - The resistance of the inductor winding measured with no alternating current. The DCR is most often minimized in the design of an inductor. The unit of measure is ohms and it is usually specified as a maximum rating.",
    },
    {
      "id": 1,
      "word": "DCS 1800",
      "def": "A variant of GSM operating at or near 1.8 GHz.",
    },
    {
      "id": 1,
      "word": "DCS 1900",
      "def":
          "A variant of GSM operating at or near 1.9 GHz used in the United States.",
    },
    {
      "id": 1,
      "word": "deci",
      "def":
          "A prefix which indicates a factor 10-1 (one tenth). Abbreviated as 'd.'",
    },
    {
      "id": 1,
      "word": "Decibel",
      "def":
          "One tenth of a Bel (B). The abbreviation for decibel is 'dB.' If N = P1/P2 is the ratio of two powers, then this ratio, N, expressed in decibels, is N = 10 log10(P1/P2).",
    },
    {
      "id": 1,
      "word": "Decoupling",
      "def":
          "Refers to a magnetic circuit where comparatively more of the flux generated by the MMF fringes around the magnetic material instead of entering it.",
    },
    {
      "id": 1,
      "word": "DECT",
      "def": "Digital European Cordless Telephone.",
    },
    {
      "id": 1,
      "word": "Dedicated Line",
      "def":
          "A transmission circuit installed between two sites of a private network and 'open,' or available, at all times.",
    },
    {
      "id": 1,
      "word": "deka",
      "def": "A prefix that indicates a factor 10, abbreviated as 'da.'",
    },
    {
      "id": 1,
      "word": "Delay Line",
      "def":
          "A transmission line or circuit that imposes a desired amount of propagation delay on an incident signal. Delay lines may also be specified in terms of the phase shift they produce as a result of the propagation delay.",
    },
    {
      "id": 1,
      "word": "Delay skew",
      "def":
          "The difference in propagation delay between the slowest and fastest pairs in a cable or system.",
    },
    {
      "id": 1,
      "word": "Delta",
      "def":
          "Arithmetic difference between two numbers, or the change in value of a parameter.",
    },
    {
      "id": 1,
      "word": "Demagnetization Curve",
      "def":
          "That portion of the hysteresis loop that lies between the residual induction point (BR) and the coercive force point (HC).",
    },
    {
      "id": 1,
      "word": "Demagnetized",
      "def":
          "A material condition where a ringing AC field has reduced the remnant induction to or near zero. A ringing AC field is a continually decreasing sinusoidal field. A pulsed DC field can be used to achieve gross demagnetization, but with much effort and with residual local magnetization.",
    },
    {
      "id": 1,
      "word": "Demodulation",
      "def":
          "The process of recovering intelligence from a signal, some parameter of which was modified to carry the intelligence (see modulation).",
    },
    {
      "id": 1,
      "word": "Density",
      "def": "See Power Density.",
    },
    {
      "id": 1,
      "word": "Depletion Layer",
      "def":
          "The insulating region in a rectifying semiconductor junction immediately surrounding and including the junction, caused by the space charge that occurs at the junction, which acts to deplete the concentration charge carriers in the region.",
    },
    {
      "id": 1,
      "word": "Derating",
      "def":
          "For a DC-DC converter, the specified reduction in output power required for operation at elevated temperatures. The most common operating temperature reange specified. Also see Convection Cooled.",
    },
    {
      "id": 1,
      "word": "Desensitization",
      "def":
          "The reduction in receiver sensitivity that is the result of the presence of large magnitude, off-channel signals.",
    },
    {
      "id": 1,
      "word": "Detector",
      "def":
          "(1) A circuit that produces a low frequency output signal, typically DC or video, whose amplitude is dependent upon the RF incident power level. The semiconductor element in a detector is typically a Schottky diode, FET or a tunnel diode. (2) An optoelectronic transducer used in fiber optics for converting optical power to electric current. In fiber optics, usually a photodiode.",
    },
    {
      "id": 1,
      "word": "DGPS",
      "def": "Differential GPS",
    },
    {
      "id": 1,
      "word": "Dial up",
      "def":
          "A type of communication that is established by a switched-circuit connection using the telephone network.",
    },
    {
      "id": 1,
      "word": "Diameter-mismatch loss",
      "def":
          "The loss of power at a joint that occurs when the transmitting half has a diameter greater than the diameter of the receiving half. The loss occurs when coupling light from a source to fiber, from fiber to fiber, or from fiber to detector.",
    },
    {
      "id": 1,
      "word": "Dichroic filter",
      "def":
          "An optical filter that transmits light selectively according to wavelength.",
    },
    {
      "id": 1,
      "word": "Dielectric",
      "def":
          "A dielectric material is a substance that is a poor conductor of electricity, but an efficient supporter of electrostatic fields. Placing a dielectric between two metal plates, across which a voltage is applied, results in a slight separation of the positive and negative charges in the dielectric. This charge separation helps support the electric field between the plates and can store energy. This property is useful in capacitors, especially at radio frequencies. Dielectric materials are also used in the construction of radio-frequency transmission lines.",
    },
    {
      "id": 1,
      "word": "Dielectric Breakdown",
      "def":
          "The voltage required to cause an electrical failure or breakthrough of the insulation. Determined by a destructive test. See also Breakdown Voltage.",
    },
    {
      "id": 1,
      "word": "Dielectric Constant",
      "def":
          "(also K) The ratio of the capacitance between two electrodes with a solid, liquid, or gaseous dielectric, to the capacitance with air between the electrodes. Also called permittivity and specific inductive capacity.Generally low values are desirable for insulation.",
    },
    {
      "id": 1,
      "word": "Dielectric Loss",
      "def":
          "The time rate at which electric energy is converted into heat energy in a dielectric that is subjected to a varying electric field.",
    },
    {
      "id": 1,
      "word": "Dielectric Strength",
      "def":
          "The maximum allowable AC rms voltage (50 or 60 Hz) which may be applied between two test points, such as the coil and case or current carrying and non-current carrying points, without a leakage current in excess of 1 milliamp.",
    },
    {
      "id": 1,
      "word": "Dielectric Strength - Electric Strength - Hipot",
      "def":
          "The two most important, basic, and unique features that signal-isolation transformers provide are balance and physical separation, i.e. a dielectric barrier. The physical separation of the primary and secondary windings (or line-side and chip-side windings) allows sensitive low-voltage circuits to be safely electromagnetically connected to circuit nodes exposed to high voltage potentials without a direct conductive path. The voltage rating of a transformer is called out by its dielectric strength level in VACRMS or VDC. The transformer is guaranteed to isolate the primary and secondary windings from high-voltage transients below this rated level. The typical dielectric level for most telecom applications is 1500VACRMS for a one minute duration. At some voltage potential, a leakage current will begin to flow through the protective insulation. When the magnitude of this current exceeds a predefined level (typically 500?A), Insulation Breakdown or Dielectric Breakdown is said to have occurred. As per UL1950 (5.3.2): 'Insulation breakdown is considered to have occured when the current which flows as a result of the application of the test voltage rapidly increses in an uncontrolled manner, i.e. the insulation does not restrict the flow of the current. Corona discharge or a single momentary flashover is not regarded as insulation breakdown.'",
    },
    {
      "id": 1,
      "word": "Dielectric Withstand Voltage",
      "def":
          "DWV - The voltage level at which the dielectric breaks down, allowing conduction between isolated conductors or between a conductor and the core. Isolation, or hipot is the ability of a transformer to withstand a specific breakdown voltage between the primary and secondary windings.",
    },
    {
      "id": 1,
      "word": "Differential Mode",
      "def":
          "A current conduction mode in which currents, relative to two conductors, are flowing 180? out of phase, with equal magnitude within the conductors.",
    },
    {
      "id": 1,
      "word": "Differential Mode Current",
      "def":
          "The intended signal currents that are equal and oppositely directed on pairs of signal and return (ground) conductors.",
    },
    {
      "id": 1,
      "word": "Differential Mode Noise",
      "def":
          "Also known as normal-mode noise. It is the electrical interference that is not common to both lines, but is present between both lines.",
    },
    {
      "id": 1,
      "word": "Differential Mode Voltage",
      "def":
          "The voltage that drives equal and oppositely directed currents to achieve an intended circuit function. The source of differential mode current.",
    },
    {
      "id": 1,
      "word": "Diffraction grating",
      "def":
          "An array of fine, parallel, equally spaced reflecting or transmitting lines that mutually enhance the effects of diffraction to concentrate the diffracted light in a few directions determined by the spacing of the lines and by the wavelength of the light.",
    },
    {
      "id": 1,
      "word": "Diffusion",
      "def":
          "The movement of electrical charge carriers or particles from regions of high concentration to regions of lower concentration. In semiconductor fabrication, the movement of impurity atoms during high temperature annealing.",
    },
    {
      "id": 1,
      "word": "Digital",
      "def":
          "Having or pertaining to the use of numbers expressed in digits to represent all of the variables of a system. Using, pertaining to, or consisting of that class of devices whose performance varies only in discrete steps.",
    },
    {
      "id": 1,
      "word": "Digital Signal 0 (DS-0)",
      "def":
          "North American Digital Hierarchy signaling standard for transmission at 64 kbps. (2) Digital Signal Level 0 is the worldwide standard transmission rate (64 kbps) for PCM digitized voice channels. 24 DSOs exist in each DSI (T1) signal.",
    },
    {
      "id": 1,
      "word": "Digital Signal 1 (DS-1)",
      "def":
          "North American Digital Hierarchy signaling standard for transmission sat 2.544 Mbps. Supports 24 simultaneous DS-O signals. Term often used interchangeably with T-1, although DS-1 signals may be exchanged over other transmission systems.",
    },
    {
      "id": 1,
      "word": "Diode",
      "def":
          "A two-terminal device which has nonlinear and asymmetrical (about zero) voltage versus current characteristics.",
    },
    {
      "id": 1,
      "word": "Diplexer",
      "def":
          "A circuit or system that allows the ability to transmit and receive two distinct signals simultaneously.",
    },
    {
      "id": 1,
      "word": "Diplexing",
      "def":
          "The simultaneous transmission or reception of two signals though a common component, such as an antenna.",
    },
    {
      "id": 1,
      "word": "Direct Current",
      "def": "A flow of charge carriers within a medium in a single direction.",
    },
    {
      "id": 1,
      "word": "Direct Current Resistance",
      "def":
          "DCR - The resistance of the inductor winding measured with no alternating current. The DCR is most often minimized in the design of an inductor. The unit of measure is ohms and it is usually specified as a maximum rating.",
    },
    {
      "id": 1,
      "word": "Direction of Lay",
      "def":
          "The lateral direction in which the strands or elements of a cable run over the top of the cable as they recede from the observer. Expressed as right-hand or left-hand lay.",
    },
    {
      "id": 1,
      "word": "Directional Coupler",
      "def":
          "A four port device that transmits the majority of signal power incident on its input port to the output port and the remainder of the signal power to a third, coupled port. Signals incident on the output port are coupled to the fourth, coupled port, which may be terminated with a resistor equal in value to the coupler's characteristic impedance. The ratio of the coupled power to the input power is the coupling factor.",
    },
    {
      "id": 1,
      "word": "Disable",
      "def":
          "The act of de-asserting the enable signal to turn off the device. In the case of an EN low device, the EN signal must fall below the typical threshold voltage of 1.5V.",
    },
    {
      "id": 1,
      "word": "Disaccommodation (DF)",
      "def":
          "The proportional decrease of permeability after a disturbance of a magnetic material, measured at a constant temperature, over a given time interval. The resultant permeability after magnetic conditioning divided by the permeability of the first measurement times log10 of the ratio of time interval.",
    },
    {
      "id": 1,
      "word": "Discontinuity",
      "def":
          "A broken connection, or the loss of a specific connection characteristic. Also, the temporary interruption or variation in current or voltage.",
    },
    {
      "id": 1,
      "word": "Discrete",
      "def":
          "Complete in and of itself. In electronics, a discrete component consists of a single circuit element in a package, for example a diode or transistor. In practice, some components considered discrete may actually consist of a few simple circuit elements in a single package.",
    },
    {
      "id": 1,
      "word": "Discrete Air Gap",
      "def":
          "Mechanical air gap created by a small number of breaks in the magnetic path. In a standard C-core this number is generally two, a standard E-core is generally three, etc.",
    },
    {
      "id": 1,
      "word": "Discriminator",
      "def":
          "A tuned circuit that produces an output voltage, the amplitude and polarity of which are determined by the frequency of the input signal. A discriminator is used as the demodulator in an FM receiver.",
    },
    {
      "id": 1,
      "word": "D-ISDN",
      "def": "broadband integrated services digital network",
    },
    {
      "id": 1,
      "word": "Dispersion",
      "def":
          "A general term for those phenomena that cause a broadening or spreading of light as it propagates through an optical fiber. The three types are modal, material, and waveguide.",
    },
    {
      "id": 1,
      "word": "Dissipation",
      "def":
          "The conversion of electrical energy to heat energy in a component.",
    },
    {
      "id": 1,
      "word": "Dissipation Factor",
      "def":
          "The ratio between the permittivity and the conductivity of a dielectric.",
    },
    {
      "id": 1,
      "word": "Distortion",
      "def":
          "Any deviation from the mathematical ideal of a real-world periodic waveform, which is specified as a percent of the desired signal. Distortion can be expressed mathematically in terms of the harmonics of the fundamental frequency. This parameter is of considerable importance in instrumentation transformers.",
    },
    {
      "id": 1,
      "word": "Distortion-limited operation",
      "def": "Generally synonymous with bandwidth-limited operation.",
    },
    {
      "id": 1,
      "word": "Distributed Air Gap",
      "def":
          "A major feature of iron powder cores. It is the cumulative effect of many small gaps distributed evenly throughout the core. In a typical MPP core, the number of separate air gaps results from the use of powder to construct the core and numbers in the millions. The result is minimal fringing flux density compared to a core with one or two discrete air gaps in the magnetic path.",
    },
    {
      "id": 1,
      "word": "Distributed Capacitance",
      "def":
          "(1) In the construction of an inductor, each turn of wire or conductor acts as a capacitor plate. The combined effects of each turn can be presented as a single capacitance known as the distributed capacitance. The capacitance is in parallel with the inductor. This parallel combination will resonate at some frequency, which is called the self-resonant frequency (SRF). Lower distributed capacitance for a given inductance will result in a higher SRF and vice versa. (2) Capacitance that is not concentrated within a lumped capacitor, but spread over a circuit or group of components.",
    },
    {
      "id": 1,
      "word": "Distributed Inductance",
      "def":
          "Inductance that is not concentrated within a lumped inductor, but spread over a circuit or group of components.",
    },
    {
      "id": 1,
      "word": "Distributed Power",
      "def":
          "System level architecture in which converters operating from a central power bus provide localized power (and various voltage levels) to individual subassemblies/components. The type of power distribution system used is highly dependent upon the needs of a particular application.",
    },
    {
      "id": 1,
      "word": "DLC",
      "def": "digital loop carrier",
    },
    {
      "id": 1,
      "word": "DLEC",
      "def": "digital local carrier",
    },
    {
      "id": 1,
      "word": "DMA",
      "def":
          "Direct Memory Access, it bypasses the CPU-peripheral bottleneck and permits the transfer of data between a peripheral and the microcomputer's random access memory without the active intervention of the CPU.",
    },
    {
      "id": 1,
      "word": "DMT",
      "def":
          "Discrete Multitone. In DMT, a large number of low-rate carrier frequencies are QAM-modulated at a low rate to transmit a single high-rate data stream. DMT is used for ADSL and proposed for VDSL.",
    },
    {
      "id": 1,
      "word": "DOCSIS",
      "def": "Data Over Cable System Interface Specification",
    },
    {
      "id": 1,
      "word": "DoD",
      "def":
          "The United States Department of Defense. (which manages and controls the GPS)",
    },
    {
      "id": 1,
      "word": "Donor",
      "def":
          "A material that is intentionally added to a pure semiconductor material in order to increase the population of free electrons in that semiconductor, resulting in a net negative charge. A semiconductor that has had donor material added to it is called 'n-type.'",
    },
    {
      "id": 1,
      "word": "DOP",
      "def": "Dilution Of Precision",
    },
    {
      "id": 1,
      "word": "Dopant",
      "def":
          "An impurity added to a pure substance to alter the behavior or properties of the pure substance. Dopants in semiconductors are either charge carrier donors or acceptors, and make the semiconductor either n-type (surplus electrons), or p-type (shortage of electrons).",
    },
    {
      "id": 1,
      "word": "Doping",
      "def":
          "The intentional addition of a foreign substance to a pure substance in order to alter the behavior or properties of the pure substance.",
    },
    {
      "id": 1,
      "word": "Doppler Effect",
      "def":
          "The apparent shift in frequency of an incident wave that is the result of relative velocity between the emitter of the wave and the receiver of the wave. The Doppler shift frequency (fd) is given by: fd = 2 V (f0 / c) cosF, where: f0 is transmitter frequency in Hz, c is velocity of light (3 x 108 meters per second), V is the magnitude of the relative velocity (meters per second), ? is the angle between the incident wave and target's path. Note: cos ? is 1 for motion directly toward or away from the receiver. Velocity (V) is a vector that determines the sign of doppler shift frequency.",
    },
    {
      "id": 1,
      "word": "Doppler Radar",
      "def":
          "A radar system that uses the Doppler effect to measure presence and velocity of a target. The commercial Doppler systems, such as police radars and intrusion alarms, usually operate with a 'zero IF' because the transmitter source (Gunn oscillator) is also used as the local oscillator for the mixer. Using this technique, the frequency of the IF signal is the Doppler shift frequency. For example, if the transmitter frequency is 10.525 GHz, a vehicle traveling at 50 mph will cause a Doppler shift of 1568 Hz.",
    },
    {
      "id": 1,
      "word": "Doppler Shift",
      "def":
          "The apparent shift in frequency of an incident wave that is the result of relative velocity between the emitter of the wave and the receiver of the wave. The Doppler shift frequency (fd) is given by: fd = 2 V (f0 / c) cosF, where: f0 is transmitter frequency in Hz, c is velocity of light (3 x 108 meters per second), V is the magnitude of the relative velocity (meters per second), ? is the angle between the incident wave and target's path. Note: cos ? is 1 for motion directly toward or away from the receiver. Velocity (V) is a vector that determines the sign of doppler shift frequency.",
    },
    {
      "id": 1,
      "word": "Double Balanced Mixer",
      "def":
          "A frequency translation circuit, which consists of four components with nonlinear impedance, typically Schottky diodes or FET's, connected in a ring quad configuration, with balun transformers at the RF and LO inputs to connect unbalanced transmission lines to the balanced quad. The IF output is via an unbalanced transmission line. The term balanced mixer is used to imply that neither of the input terms will appear at the mixer output. In practice, suppression of these input components is never perfect in an analog mixer circuit. Both types of mixer produce signals at odd harmonics of the carrier frequency, particularly the diode ring mixer. In most cases, these can be easily filtered out.",
    },
    {
      "id": 1,
      "word": "Downconverter (Mixer)",
      "def":
          "A mixer whose desired output signal called the IF signal is the difference of the incident RF and LO signals.",
    },
    {
      "id": 1,
      "word": "DQPSK",
      "def": "Differential quadrature phase shift key modulation.",
    },
    {
      "id": 1,
      "word": "DR",
      "def": "Dead Reckoning",
    },
    {
      "id": 1,
      "word": "Drain",
      "def":
          "The terminal at one end of the channel of a field effect transistor (FET) from which electron or hole current leaves the channel. This terminal corresponds to the collector in a bipolar transistor.",
    },
    {
      "id": 1,
      "word": "Drain Wire",
      "def":
          "In a cable, an uninsulated conductor laid over the component, or components, in a foil-shield cable. Used as a ground connection.",
    },
    {
      "id": 1,
      "word": "Drift",
      "def":
          "Change in the output voltage of a converter over a specified period of time. All other operating parameters (load, line, etc.) are assumed to be held constant. Often specified as starting after a warm up period.",
    },
    {
      "id": 1,
      "word": "Driver",
      "def":
          "A circuit that supplies an input to another circuit, and (usually) provides a level boost, impedance matching, or isolation.",
    },
    {
      "id": 1,
      "word": "Drop",
      "def":
          "Refers to the horizontal cabling for one work area, as in 'The job has 100 drops.'",
    },
    {
      "id": 1,
      "word": "Drop Cable",
      "def":
          "A cable that connects a network device such as a computer to a physical medium such as an Ethernet network. Drop cable is also called transceiver cable because it runs from the network node to a transceiver (a transmit/receiver) attached to the trunk cable.",
    },
    {
      "id": 1,
      "word": "Drop-out Voltage",
      "def":
          "The voltage at which all contacts return to their ?normal?, unoperated positions. (Applicable only to non-latching relays.)",
    },
    {
      "id": 1,
      "word": "DSL",
      "def":
          "Digital Subscriber Line- Another name for an ISDN BRI channel. Operated at the Basic Rate Interface (with two 64 kbps circuit switched channels and one 16 kbps packet switched channel), the DSL can carry both voice and data signal at the same time, in both directions, as well as the signaling data used for call information and customer data.",
    },
    {
      "id": 1,
      "word": "DSLAM",
      "def": "digital subscriber line access multiplexer",
    },
    {
      "id": 1,
      "word": "DSP",
      "def":
          "Digital Signal Processor- The processing of signal transmission using digital techniques.",
    },
    {
      "id": 1,
      "word": "DSSS",
      "def":
          "Direct Sequence Spread Spectrum. A transmission technique that uses a pseudo-random, noise-like modulation code to widen the spectrum of the transmitted signal.",
    },
    {
      "id": 1,
      "word": "DTK",
      "def": "Desired Track",
    },
    {
      "id": 1,
      "word": "Duplex",
      "def":
          "The ability in a communications systems to simultaneously transmit and receive signals through a common component such as an antenna.",
    },
    {
      "id": 1,
      "word": "Duplex cable",
      "def": "A two-fiber cable suitable for duplex transmission.",
    },
    {
      "id": 1,
      "word": "Duplex transmission",
      "def":
          "Transmission in both directions, either one direction at a time (half duplex) or both directions simultaneously (full duplex).",
    },
    {
      "id": 1,
      "word": "Duplexer",
      "def":
          "A circuit or component that allows a communications system to simultaneously transmit and receive signals through a common component, such as an antenna. Such systems typically use different frequencies for the transmit and receive signals, so the duplexer is often a pair of filters, each tuned to pass the desired signal frequency and reject the other signal frequency.",
    },
    {
      "id": 1,
      "word": "Duroid",
      "def":
          "A commercially available product used to make microwave printed circuit boards, especially those employing microstrip, strip line and coplanar waveguide transmission line structures. The dielectric layer of Duroid' is tightly controlled and is available with a number of different relative dielectric constants and physical thicknesses.",
    },
    {
      "id": 1,
      "word": "Dust Cover",
      "def":
          "An item specifically designed to cover the mating end of a connector for mechanical and/or environmental protection.",
    },
    {
      "id": 1,
      "word": "Duty Cycle",
      "def":
          "Maximum recommended usage (cycles) per unit of time. Alternatively, the percent of the 'on' time of a square wave in a switching power supply.",
    },
    {
      "id": 1,
      "word": "DWDM",
      "def": "dense wavelength division multiplexing",
    },
    {
      "id": 1,
      "word": "DWV",
      "def":
          "Dielectric Withstanding Voltage - A test voltage for a wire, cable, or insulation.",
    },
    {
      "id": 1,
      "word": "Dynamic Load",
      "def":
          "Output load that changes rapidly. Normally specified as both a load change value and a rate of change.",
    },
    {
      "id": 1,
      "word": "Dynamic Range",
      "def":
          "The power range over which a component or system functions properly.",
    },
    {
      "id": 1,
      "word": "Dynamic Response",
      "def":
          "Output overshoot that occurs when the converter output load is turned on/off or abruptly changed. This overshoot gives the high frequency output impedance of the converter. Also see Output Impedance.",
    },
    {
      "id": 1,
      "word": "E",
      "def": "Symbol used for voltage. Also written e.",
    },
    {
      "id": 1,
      "word": "E1",
      "def":
          "The term for a digital facility used for transmitting data over a telephone network at 2.048 Mbps. The European equivalent of T1.",
    },
    {
      "id": 1,
      "word": "E3",
      "def":
          "The highest transmission rate generally available in the European digital infrastructure (34 Mbps).",
    },
    {
      "id": 1,
      "word": "EAROM",
      "def":
          "Electrically alterable readonly memory. A reprogrammable ROM in which each cell can be individually erased by a special electrical process.",
    },
    {
      "id": 1,
      "word": "EBCDIC",
      "def":
          "Extended Binary-Coded Decimal Interchange Code. An 8-bit code used to represent 256 unique letters, numbers, and special characters.",
    },
    {
      "id": 1,
      "word": "ECCM",
      "def":
          "The defensive use of electronic warfare to counteract an opponent's electronic countermeasures.",
    },
    {
      "id": 1,
      "word": "E-CGI",
      "def": "Enhanced Cell Global Identity",
    },
    {
      "id": 1,
      "word": "Echo Cancellation",
      "def":
          "Process by which a transmitter/receiver cancels out the transmitted signal as to 'hear' the received signal better.",
    },
    {
      "id": 1,
      "word": "ECL",
      "def":
          "Emitter coupled logic - A bipolar logic family that works by diverting current from one path to another, rather than by switching transistors on and off. Characterized by very fast operating speeds and high power dissipation. Also called currentmode logic (CML).",
    },
    {
      "id": 1,
      "word": "ECM",
      "def": "The offensive use of electronic warfare.",
    },
    {
      "id": 1,
      "word": "eco",
      "def": "Abbreviation for electron-coupled oscillator.",
    },
    {
      "id": 1,
      "word": "Eddy Current Losses",
      "def":
          "Core losses associated with the electrical resistivity of the magnetic material and induced voltages within the material. Eddy currents are inversely proportional to material resistivity and proportional to the rate of change of flux density. Eddy current losses are present in both the magnetic core and windings of an inductor. Eddy currents in the winding, or conductor, contribute to two main types of losses: losses due to proximity effects and skin effects. As for the core losses, an electric field around the flux lines in the magnetic field is generated by alternating magnetic flux. This will result in eddy currents if the magnetic core material has electrical conductivity. Losses result from this phenomenon since the eddy currents flow in a plane that is perpendicular to the magnetic flux lines. Eddy current and hysteresis losses are the two major core loss factors. Eddy current loss becomes dominant in powder cores as the frequency increases.",
    },
    {
      "id": 1,
      "word": "EDFA",
      "def": "Erbium-doped fiber amplifier.",
    },
    {
      "id": 1,
      "word": "EDGE",
      "def": "Enhanced Data rates for Global Evolution",
    },
    {
      "id": 1,
      "word": "edge connector",
      "def":
          "A connector into which the edge of a printed circuit board is inserted.",
    },
    {
      "id": 1,
      "word": "edge pad",
      "def":
          "The portion of a printed circuit pattern (path, land) extending to the edge of a printed circuit board to provide a contacting surface for some type of connector. Also referred to as terminal area.",
    },
    {
      "id": 1,
      "word": "edge-mount connector",
      "def":
          "A connector that is mounted onto the edge of a printed circuit board.",
    },
    {
      "id": 1,
      "word": "Effective Area",
      "def":
          "For a magnetic core of a given geometry, the magnetic cross-sectional area that a hypothetical toroidal core of the same material properties would possess to be the magnetic equivalent to the given core.",
    },
    {
      "id": 1,
      "word": "Effective Length",
      "def":
          "For a magnetic core of a given geometry, the magnetic length that a hypothetical toroidal core of the same material properties would possess to be the magnetic equivalent to the given core.",
    },
    {
      "id": 1,
      "word": "Effective Permeability",
      "def":
          "For a magnetic circuit constructed with an air gap, or gaps, the permeability of a hypothetical homogeneous material that would provide the same reluctance, or net permeability.",
    },
    {
      "id": 1,
      "word": "Effective Volume",
      "def":
          "For a magnetic core of a given geometry, the magnetic volume that a hypothetical toroidal core of the same material properties would possess to be the magnetic equivalent to the given core.",
    },
    {
      "id": 1,
      "word": "Efficiency",
      "def":
          "Ratio of total output power to input power expressed as a percentage. Efficiency is normally measured at full rated output power and nominal input line conditions.",
    },
    {
      "id": 1,
      "word": "egg crating",
      "def":
          "Insulation walls between each cavity within the contact/wire entry face of the housing - usually appearing as rectangular cells. Normally allows the rear portion of the contact to be fully protected by housing material, thereby preventing shorts between adjacent contacts, and minimizing the danger of shock. Sometimes used to improve cross-talk characteristics, or to minimize the flexing of wires and/or contacts.",
    },
    {
      "id": 1,
      "word": "EGNOS",
      "def": "European Geostationary Navigation Overlay System",
    },
    {
      "id": 1,
      "word": "EID",
      "def":
          "Expanded Inside Diameter - The specified minimum (as supplied) internal diameter of tubing.",
    },
    {
      "id": 1,
      "word": "Elastic Memory",
      "def":
          "The ability of a crosslinked polymer to be deformed to some predetermined shape, hold that shape for a period, and then return to its original shape upon the application of heat.",
    },
    {
      "id": 1,
      "word": "elastomer",
      "def":
          "A material which at room temperature stretches under low stress to at least twice its length and snaps back to original length upon release of stress.",
    },
    {
      "id": 1,
      "word": "Electric Current",
      "def": "The movement of electric charge carriers in a medium.",
    },
    {
      "id": 1,
      "word": "Electric Field",
      "def": "Electric forces within a physical volume.",
    },
    {
      "id": 1,
      "word": "Electrical Length",
      "def":
          "Physical length expressed in terms of the wavelength of a signal for the medium in which the component or structure is situated. The units are degrees, radians or grads.",
    },
    {
      "id": 1,
      "word": "Electricity",
      "def": "A form of energy caused by the movement of electrons.",
    },
    {
      "id": 1,
      "word": "electroless plating",
      "def":
          "A chemical process by which nonconductive materials may be plated with a thin highly conductive film without using electric current. A thicker deposit of the desired metal may then be applied using standard electroplating methods.",
    },
    {
      "id": 1,
      "word": "Electromagnetic Field",
      "def": "Electric and magnetic forces that exist in a physical volume.",
    },
    {
      "id": 1,
      "word": "Electromagnetic Interference",
      "def":
          "EMI - An unwanted electrical energy in any form. EMI is often used interchangeably with 'noise' and 'interference'.",
    },
    {
      "id": 1,
      "word": "Electromagnetic Radiation",
      "def":
          "The emanation of an electromagnetic field from a source through space.",
    },
    {
      "id": 1,
      "word": "Electromotive Force",
      "def":
          "The force that causes charge carriers to move from a location with high potential to a location with lower potential.",
    },
    {
      "id": 1,
      "word": "Electron",
      "def":
          "A subatomic particle that orbits the nucleus of an atom. Electrons have a negative charge. The charge of a single electron is -1.6 * 10-19 coulombs. When electrons escape from the immediate confines of an atom and move through a material, this motion constitutes electric current.",
    },
    {
      "id": 1,
      "word": "Electronic Counter-countermeasures",
      "def":
          "The defensive use of electronic warfare to counteract an opponent's electronic countermeasures.",
    },
    {
      "id": 1,
      "word": "Electronic Countermeasures",
      "def": "The offensive use of electronic warfare.",
    },
    {
      "id": 1,
      "word": "Electronic Intelligence",
      "def":
          "The surreptitious gathering of information from an opponent or enemy through the use of electronic systems.",
    },
    {
      "id": 1,
      "word": "electronic interference",
      "def":
          "An electrical or electromagnetic disturbance that causes undesirable response in electronic equipment. Electrical interference refers specifically to interference caused by the operation of electrical apparatus that is not designed to radiate electromagnetic energy.",
    },
    {
      "id": 1,
      "word": "Electronic Warfare",
      "def":
          "The use of electronic signals and systems to disrupt the function of an opponent's surveillance, defense or communications systems.",
    },
    {
      "id": 1,
      "word": "Electronics",
      "def":
          "The field of applied physics concerned with the behavior of electrons, especially when they move as current, in devices and materials.",
    },
    {
      "id": 1,
      "word": "electrostatic discharge",
      "def":
          "The sudden discharge of electrostatic charge that occurs when a charged conductor is grounded.",
    },
    {
      "id": 1,
      "word": "Electrostatic Discharge",
      "def":
          "ESD - Current produced by two objects having a static charge when they are brought close enough to produce an arc or discharge.",
    },
    {
      "id": 1,
      "word": "Electrostatic Sensitivity",
      "def":
          "The degree to which a component or device is susceptible to damage by electrostatic discharge.",
    },
    {
      "id": 1,
      "word": "Electrostatic Shield",
      "def":
          "Electrostatic shield that reduces coupling capacitance in transformers. The shield, which effectively reduces output common mode noise, is placed between the primary and secondary windings of a transformer. Also known as Faraday Shield.",
    },
    {
      "id": 1,
      "word": "electro-tinned",
      "def": "Electrolytic process of tinning wire using pure tin.",
    },
    {
      "id": 1,
      "word": "ELFEXT",
      "def":
          "Equal Level Far End Crosstalk. A measure of FEXT which accounts for the attenuation of the cabling system.",
    },
    {
      "id": 1,
      "word": "ELINT",
      "def":
          "The surreptitious gathering of information from an opponent or enemy through the use of electronic systems.",
    },
    {
      "id": 1,
      "word": "Elongation",
      "def":
          "The ultimate elongation, or elongation at rupture. Expressed as a percentage of original length.",
    },
    {
      "id": 1,
      "word": "embossing",
      "def":
          "A marker identification by means of thermal indentation leaving raised lettering on the sheath material of cable.",
    },
    {
      "id": 1,
      "word": "EMC",
      "def":
          "Electromagnetic compatibility. The ability of an electronic device to operate in its intended environment without its performance being affected by EMI and without generating EMI that will affect other equipment.",
    },
    {
      "id": 1,
      "word": "EMD",
      "def": "Equilibrium mode distribution.",
    },
    {
      "id": 1,
      "word": "emf",
      "def": "Electromotive force (voltage).",
    },
    {
      "id": 1,
      "word": "EMI",
      "def":
          "Electro-Magnetic Interference - An unwanted electrical energy in any form. EMI is often used interchangeably with 'noise' and 'interference'.",
    },
    {
      "id": 1,
      "word": "EMI Filter",
      "def":
          "Filter placed at the input to an off-line converter that minimizes the effect of EMI on the converter and the associated system.",
    },
    {
      "id": 1,
      "word": "Emitter",
      "def":
          "The layer of a bipolar transistor through which all current flows and from which majority carriers are injected into the base of the transistor, where they are considered minority carriers.",
    },
    {
      "id": 1,
      "word": "Emitter Bias",
      "def":
          "The DC voltage or current that is applied to the emitter of a transistor to establish its operating point.",
    },
    {
      "id": 1,
      "word": "Emitter Current",
      "def": "The current that flows through the emitter of a transistor.",
    },
    {
      "id": 1,
      "word": "emitter-coupled logic",
      "def":
          "Abbreviated ECL. A bipolar logic family that works by diverting current from one path to another, rather than by switching transistors on and off. Characterized by very fast operating speeds and high power dissipation. Also called currentmode logic (CML).",
    },
    {
      "id": 1,
      "word": "emulator",
      "def":
          "An electronic circuit or computer program that performs functionally like another circuit or program; for example, a computer of one manufacturer emulating that of another manufacturer.",
    },
    {
      "id": 1,
      "word": "Enable",
      "def":
          "The act of asserting the enable signal to turn on the device. In the case of an EN low device, the EN signal must exceed the typical threshold voltage of 1.5V.",
    },
    {
      "id": 1,
      "word": "Enable High/Low",
      "def":
          "Some USB controller ships have enable logic that requires the power switch to be active low while others require the switch to be active high. This signal will be connected to the enable pin of the device selected.",
    },
    {
      "id": 1,
      "word": "Encapsulant",
      "def":
          "Description related to the way dual-wall tubing products and precoated molded parts melt and flow when heated, filling any void in the area being covered. Unlike an adhesive, an encapsulant does not form a mechanical bond to the substrate.",
    },
    {
      "id": 1,
      "word": "encapsulation",
      "def":
          "The process of embedding electrical components and conductors in a mechanically protective coating.",
    },
    {
      "id": 1,
      "word": "Enclosure",
      "def":
          "Case or container used to package a converter. Typically, converters are packaged in small plastic or metal.",
    },
    {
      "id": 1,
      "word": "encoder",
      "def":
          "A device which translates information from one form (code) to another (eg decimal to binary encoder). Normally, an encoder is used in the device sending the information.",
    },
    {
      "id": 1,
      "word": "End",
      "def":
          "The number of fibers or strands per carrier in braiding operations.",
    },
    {
      "id": 1,
      "word": "end of message",
      "def":
          "EOM - Usually a unique character in a data stream that indicates the end of a block of information data.",
    },
    {
      "id": 1,
      "word": "Energy Storage (.5LI2)",
      "def":
          "The amount of magnetic energy which can be stored in a given inductor in microjoules. It is the product of one half the inductance required in microhenries (?H) and the current (I) squared in amperes.",
    },
    {
      "id": 1,
      "word": "Energy Storage Inductors",
      "def":
          "Inductors used for energy storage, generally in power conversion rather than filtering or tuning.",
    },
    {
      "id": 1,
      "word": "engaging force",
      "def":
          "Force required to either engage or separate contacts - both in and out of the connector housing or insert. Values are generally established for maximum and minimum forces. Performance acceptance level vary per specification or customer requirements. Sometimes the forces are not only measured initially, but also after specified number of engagements and separations.",
    },
    {
      "id": 1,
      "word": "Enhanced Category 5",
      "def":
          "Also called Category 5e.A performance classification for twisted pair cables, connectors and systems.Specified to 100 MHz.Suitable for voice and data applications up to 1000 Mbps.",
    },
    {
      "id": 1,
      "word": "Enterprise Network",
      "def":
          "A large typical corporate network under the auspices of one organization.",
    },
    {
      "id": 1,
      "word": "environment",
      "def":
          "The aggregate of all conditions (such as temperature, humidity, radiation, magnetic and electric fields, shock, and vibration) which externally influences the performance of an item.",
    },
    {
      "id": 1,
      "word": "environmentally sealed",
      "def":
          "A unit that is provided with gaskets, seals, grommets, potting, or other means to keep out moisture, dirt, air, or dust which might reduce or impair its performance. Does not include nonphysical environments such as RF and radiation.",
    },
    {
      "id": 1,
      "word": "EOM",
      "def":
          "End of Message. Usually a unique character in a data stream that indicates the end of a block of information data.",
    },
    {
      "id": 1,
      "word": "E-OTD",
      "def": "Enhanced Observed Time Difference",
    },
    {
      "id": 1,
      "word": "EPE",
      "def": "Estimated Position Error",
    },
    {
      "id": 1,
      "word": "Epitaxial",
      "def":
          "Of or pertaining to a layer of single crystal material grown on a crystalline substrate, with the same crystal orientation in both regions.",
    },
    {
      "id": 1,
      "word": "epitaxial layer",
      "def":
          "A thin precisely doped monocrystalline layer of silicone grown onto a heavily doped thick wafer, and into which the semiconductor junctions are diffused. In conventional integrated circuit processing, the thick wafer is 'p' doped, and the epitaxial layer is 'n' doped.",
    },
    {
      "id": 1,
      "word": "epoxy",
      "def":
          "A family of thermosetting resins used in the packaging of semiconductor devices. Epoxies form a chemical bond to many metal surfaces, and may be cast or molded. Epoxy should not be confused with silicone resins.",
    },
    {
      "id": 1,
      "word": "EPROM",
      "def":
          "Erasable, programmable read-only memory. A ROM in which the programmed data can be erased and the chip reprogrammed; it differs from the RAM in that the erasing and reprogramming requires special equipment not part of the system in which the EPROM is used.",
    },
    {
      "id": 1,
      "word": "EPSRC",
      "def": "Engineering &amp; Physical Science Research Council",
    },
    {
      "id": 1,
      "word": "equilibrium mode distribution",
      "def":
          "The condition in an optical fiber in which all allowable modes propagate their characteristic amount of optical energy.",
    },
    {
      "id": 1,
      "word": "Equivalent Series Inductance (ESL)",
      "def":
          "Inductance in series with an 'ideal' capacitor. Sources include leads, terminals, electrodes etc.",
    },
    {
      "id": 1,
      "word": "Equivalent Series Resistance (ESR)",
      "def":
          "Resistance in series with an 'ideal' capacitor. Sources include lead resistance, terminal losses, etc. An important specification for high frequency applications.",
    },
    {
      "id": 1,
      "word": "Erbium-doped fiber amplifier",
      "def":
          "A type of fiber that amplifies 1550-nm optical signals when pumped with a 980- or 1480-nm light source.",
    },
    {
      "id": 1,
      "word": "Error Amplifier",
      "def":
          "Operational or different amplifier used in the control feedback loop of a converter. The amplifier produces an error voltage when the output (tapped off a voltage divider network) differs from a reference voltage. This error voltage is used to adjust the oepratioin of the PWM so as to correct the sensed output voltage. Sometimes called a Reference Amplifier.",
    },
    {
      "id": 1,
      "word": "ESCON",
      "def": "An IBM channel control system based on fiber optics.",
    },
    {
      "id": 1,
      "word": "ESD",
      "def":
          "Electrostaic discharge - Current produced by two objects having a static charge when they are brought close enough to produce an arc or discharge.",
    },
    {
      "id": 1,
      "word": "ETA",
      "def": "Estimated Time Of Arrival",
    },
    {
      "id": 1,
      "word": "etchant",
      "def":
          "A solution used to remove, by chemical reaction, the unwanted portion of a conductive material bonded to a base.",
    },
    {
      "id": 1,
      "word": "etched wire",
      "def":
          "A process applied to fluoroplastic wire in which the wire is passed through a sodium bath to create a rough surface to allow epoxy resin to bond the fluoroplastic.",
    },
    {
      "id": 1,
      "word": "etched wiring substrate",
      "def":
          "A printed conductive pattern formed by chemical, or chemical and electrolytic, removal of the unwanted portion of conductive material bonded to a base.",
    },
    {
      "id": 1,
      "word": "etching",
      "def":
          "The process of removing unwanted metallic substance bonded to a base - by chemical, or chemical and electrolytic, means.",
    },
    {
      "id": 1,
      "word": "ETE",
      "def": "Estimated Time Enroute",
    },
    {
      "id": 1,
      "word": "ETFE",
      "def":
          "Ethylenetetrafluoroethylene - A copolymer of ethylene and tetrafluoroethylene. This high temperature resin is well suited for wire insulation. It can withstand an unusual amount of physical abuse during and after installation, has very good electrical characteristics, good thermal and low temperature properties, and chemical inertness.",
    },
    {
      "id": 1,
      "word": "Ethernet",
      "def":
          "A baseband LAN specification invented by Xerox Corporation and developed jointly by Xerox, Intel, and Digital Equipment Corporation. Ethernet networks operate at 10 Mbps using CSMA/CD to run over coaxial cable. Ethernet has become a series of standards produced by IEEE referred to as IEEE 802.3.",
    },
    {
      "id": 1,
      "word": "ethylenepropylene rubber",
      "def":
          "These materials offer excellent resistance to ozone and weathering, good low temperature properties, good to excellent heat resistance and high temperature properties, and excellent electrical properties. Two types of the polymer are available - the copolymer based on ethylene and propylene only, and the terpolymer in which a small amount of unsaturation pendant to the chain is added.",
    },
    {
      "id": 1,
      "word": "Eutectic Solder",
      "def":
          "A solder consisting of two or more metals, all in the appropriate proportions to allow the lowest possible melting point for the given combination.",
    },
    {
      "id": 1,
      "word": "Evaporation",
      "def": "The physical change from the liquid to the gaseous state.",
    },
    {
      "id": 1,
      "word": "EW",
      "def":
          "Electronic Warfare - The use of electronic signals and systems to disrupt the function of an opponent's surveillance, defense or communications systems.",
    },
    {
      "id": 1,
      "word": "exa",
      "def": "A prefix that indicates a factor of 1018, abbreviated as 'E'.",
    },
    {
      "id": 1,
      "word": "Excess loss",
      "def":
          "In a fiber-optic coupler, the optical loss from that portion of light that does not emerge from the nominally operational ports of the device.",
    },
    {
      "id": 1,
      "word": "Excitation Current",
      "def":
          "The current required to overcome the losses in a core, which begins to produce magnetic energy (or flux) in an inductor.",
    },
    {
      "id": 1,
      "word": "excite",
      "def":
          "To initiate or develop a magnetic field in a motor or other electrical machine.",
    },
    {
      "id": 1,
      "word": "executive control program",
      "def":
          "A main system program designed to establish priorities, and to process and control other routines.",
    },
    {
      "id": 1,
      "word": "Expanded ID",
      "def":
          "Expanded Inside Diameter - The specified minimum (as supplied) internal diameter of tubing.",
    },
    {
      "id": 1,
      "word": "Expansion Ratio",
      "def":
          "An expression of how much larger the inside diameter of a tubing is before shrinking. Specifically, the relationship of the minimum (expanded) inside diameter of tubing to the maximum (recovered) inside diameter, expressed as a ratio. See also Shrink Ratio.",
    },
    {
      "id": 1,
      "word": "extender",
      "def":
          "A substance added to a plastic composition to reduce the amount of the primary resin required per unit volume.",
    },
    {
      "id": 1,
      "word": "external storage",
      "def":
          "That portion specially designed to receive and store information for use at a later time, external to . Also called storage.",
    },
    {
      "id": 1,
      "word": "extraction tool",
      "def":
          "A tool used for removing a contact from a connector. Most extraction tools will remove a contact in such a manner that the contact can be re-used, if desired.",
    },
    {
      "id": 1,
      "word": "Extrinsic loss",
      "def":
          "In a fiber interconnection, that portion of loss that is not intrinsic to the fiber but is related to imperfect joining, which may be caused by the connector or splice.",
    },
    {
      "id": 1,
      "word": "extrinsic properties",
      "def":
          "The properties of a semiconductor as modified by impurities or imperfectionswith in a crystal.",
    },
    {
      "id": 1,
      "word": "extrinsic semiconductor",
      "def":
          "A semiconductor whose electrical properties are dependent upon impurities added to the semiconductor crystal, in contrast to an intrinsic semiconductor whose properties are characteristic of an ideal pure crystal.",
    },
    {
      "id": 1,
      "word": "Extrusion",
      "def":
          "A process that conveys plastic insulation material, generally via a screw, through forming dies and subsequently cools the insulation material to form a predetermined shape.",
    },
    {
      "id": 1,
      "word": "eyelet",
      "def":
          "A short length of metal tubing used in the terminal holes of printed circuit boards to provide a through connection and a tight mechanical contact with the printed wiring prior to soldering. Eyelets are sometimes used in place of plated thru holes and should not be confused with 'fillets' which serve only to hold the component in place prior to soldering, and promote solder wicking.",
    },
    {
      "id": 1,
      "word": "F connector",
      "def": "A common coaxial connector used for video applications (CATV).",
    },
    {
      "id": 1,
      "word": "F crimp",
      "def":
          "A crimp that brings the center of the barrel along an open seam downward into a V.",
    },
    {
      "id": 1,
      "word": "face",
      "def":
          "A connection between two systems or devices. A shared boundary defined by common physical interconnection characteristics, signal characteristics, and meanings of interchanged signals.",
    },
    {
      "id": 1,
      "word": "face seal",
      "def":
          "Sealing of a multiple contact connector over the whole area of the interface to provide sealing around each contact. This is usually done by providing a soft insert material on one or both of the connectors which are in compression when mated. This provides an environmental seal between the interface of the plug and the interface of the receptacle and also increases the dielectric between contacts.",
    },
    {
      "id": 1,
      "word": "Failure",
      "def":
          "The inability of a component or device to perform its intended function as specified by the manufacturer.",
    },
    {
      "id": 1,
      "word": "Failure Analysis",
      "def": "A rigorous investigation of the fundamental causes of a failure.",
    },
    {
      "id": 1,
      "word": "Failure Criteria",
      "def":
          "A specific description of a condition or characteristic of a device that precludes the device from performing its intended function as specified by the manufacturer",
    },
    {
      "id": 1,
      "word": "failure mechanism",
      "def":
          "A structural or chemical defect which causes failure such as corrosion, poor bonds, or surface inversion.",
    },
    {
      "id": 1,
      "word": "Failure Mode",
      "def":
          "The manner in which a failure occurs. Reason for which a converter either does not meet or stops meeting its specified parameters.",
    },
    {
      "id": 1,
      "word": "Failure Rate",
      "def":
          "The mean proportion of failures per unit time, normally expressed in per cent per thousand hours of operation.",
    },
    {
      "id": 1,
      "word": "Fall time",
      "def":
          "The time required for the trailing edge of a pulse to fall from 90% to 10% of its amplitude; the time required for a component to produce such a result. 'Turn off time.' Sometimes measured between the 80% and 20% points.",
    },
    {
      "id": 1,
      "word": "Fan Cooled",
      "def":
          "Use of a fan (or other air moving equipment) within a (sub) system to move air across heat producing components in order to reduce the ambient temperature. Also called forced convection.",
    },
    {
      "id": 1,
      "word": "fan in",
      "def": "The number of logic inputs into a logic gate.",
    },
    {
      "id": 1,
      "word": "fan out",
      "def":
          "The number of logic inputs that can be driven by the output of a logic gate.",
    },
    {
      "id": 1,
      "word": "Farad",
      "def":
          "The unit of capacitance, abbreviated as 'F', equal to 1 coulomb per volt.",
    },
    {
      "id": 1,
      "word": "Faraday Shield",
      "def":
          "Electrostatic shield that reduces coupling capacitance in transformers. The shield, which effectively reduces output common mode noise, is placed between the primary and secondary windings of a transformer.",
    },
    {
      "id": 1,
      "word": "fatigue",
      "def":
          "The tendency of a metal to fracture in a brittle manner under conditions of repeated cyclic stressing at stress levels below its tensile strength.",
    },
    {
      "id": 1,
      "word": "Fault Mode Current",
      "def": "Input current drawn by a converter when the output is shorted.",
    },
    {
      "id": 1,
      "word": "FCC",
      "def":
          "Federal Communications Commission - US government agency that sets standards for, and governs the testing oc conducted and radiated emissions. These are system level standards, but they are typically used in specifying converters. Also see Electromagnetic Interference.",
    },
    {
      "id": 1,
      "word": "FDDI",
      "def": "Fiber Distributed Digital Interface",
    },
    {
      "id": 1,
      "word": "FDM",
      "def": "frequency division multiplexing",
    },
    {
      "id": 1,
      "word": "FDMA",
      "def": "frequency division multiple access",
    },
    {
      "id": 1,
      "word": "Federal Communications Commission",
      "def":
          "FCC - US government agency that sets standards for, and governs the testing oc conducted and radiated emissions. These are system level standards, but they are typically used in specifying converters. Also see Electromagnetic Interference.",
    },
    {
      "id": 1,
      "word": "Feed Forward",
      "def":
          "Method of improving line regulation by directly sensing the input voltage of the converter. Also see Line Regulation.",
    },
    {
      "id": 1,
      "word": "Feedback",
      "def":
          "A portion of the output signal of a device or system which is applied to the input of the system.",
    },
    {
      "id": 1,
      "word": "Feedback Loop",
      "def":
          "The portion of a circuit whose purpose is to sample the output of a system or component, process the sample and apply the processed sample to the input of the system or component. Feedback loops are employed to either provide control or correction to a circuit, or in the case of an oscillator, to permit oscillation to occur.",
    },
    {
      "id": 1,
      "word": "Feedback Path",
      "def":
          "The portion of a circuit whose purpose is to sample the output of a system or component, process the sample and apply the processed sample to the input of the system or component. Feedback loops are employed to either provide control or correction to a circuit, or in the case of an oscillator, to permit oscillation to occur.",
    },
    {
      "id": 1,
      "word": "feedthrough",
      "def":
          "A connector or terminal block, usually having double-ended terminals which permit distribution and bussing of electrical circuits. Also used to describe a bushing in a wall or bulkhead, separating compartments at different pressure levels, with terminations on both sides.",
    },
    {
      "id": 1,
      "word": "feedthrough capacitor",
      "def":
          "A feedthrough insulator that provides a desired value of capacitance between the feedthrough conductor and the metal panel or chassis through which the conductor is passing. Often used in bringing dc power into a shielded enclosure.",
    },
    {
      "id": 1,
      "word": "femto",
      "def":
          "A prefix that stands indicates a factor of 10-15, abbreviated as 'f'.",
    },
    {
      "id": 1,
      "word": "FEP",
      "def": "Fluorinated ethylene propylene.",
    },
    {
      "id": 1,
      "word": "Ferrite Bead",
      "def":
          "A small circular ferrite material structure. It is used to reduce radation",
    },
    {
      "id": 1,
      "word": "Ferrite Core",
      "def":
          "Ferrite is a magnetic material that consists of a mixed oxide of iron and other elements that are made to have a crystalline molecular structure. Firing the ferrite material at a very high temperature for a specified amount of time and temperature profile creates the crystalline structure. The general composition of ferrite is xxFe2O4 where xx represents one or several metals. The most popular metal combinations are manganese and zinc (MnZn) and nickel and zinc (NiZn). These materials can be easily magnetized with little coercive force. Available in a variety of shapes and sizes, these ceramic magnetic cores are composed of ferric oxide and a combination of manganese, zinc, or nickel. The shapes EE, PQ, UU, ETD, and dual-slab are used for high frequency power applications. Telecommunications and low power applications use pot cores, touch tone cores, EP, and RM. Slugs, rods, and beads are used for radio frequency applications.",
    },
    {
      "id": 1,
      "word": "Ferromagnetism",
      "def":
          "Ferromagnetic materials have atomic fields that align themselves parallel with externally applied fields creating a total magnetic field much greater than the applied field. Ferromagnetic materials have permeabilities much greater than air (1). Above the curie temperature, the ferromagnetic materials become paramagnetic.",
    },
    {
      "id": 1,
      "word": "Ferroresonat Transformer",
      "def":
          "Transformer in which part of the core is driven in saturation by a resonant tank circuit. The output of the transformer, taken from the saturated protion, is relative immune to variations in input voltage.",
    },
    {
      "id": 1,
      "word": "ferrule",
      "def":
          "A short tube used to make solderless connections to shielded or coaxial cable. Also molded into the plastic inserts of multiple contact connectors to provide strong, wear-resistant shoulders on which contact retaining springs can bear. The basis for alignment in many AMP fiber-optic connectors.",
    },
    {
      "id": 1,
      "word": "FET",
      "def":
          "Field-effect transistor. A transistor controlled by voltage rather than current. The flow of working current through a semiconductor channel is switched and regulated by the effect of an electric field exerted by electric charge in a region close to the channel called the gate.",
    },
    {
      "id": 1,
      "word": "FET resistor",
      "def":
          "In many MOSFET digital circuits, all components can be of a source-gate-drain structure. By adjusting the topology of the structure (and its location in the circuit) it may be considered primarily a resistor or capacitor or transistor. An FET resistor is an FET in which the gate is generally tied to the drain and used instead of a resistor load for an FET transistor.",
    },
    {
      "id": 1,
      "word": "FEXT",
      "def":
          "Far End Crosstalk. Unwanted noise coupled onto a receive pair from a transmit pair at the far end of the system.",
    },
    {
      "id": 1,
      "word": "ffc",
      "def":
          "Flexible flat cable; flat flexible cable; or flexible flat conductor. A form of multiple conductor cable consisting of parallel flat metal strips imbedded in a flat flexible insulating material.",
    },
    {
      "id": 1,
      "word": "Fiber Channel",
      "def":
          "An industry-standard specification for computer channel communications over fiber optics and offering transmission speeds from 132 Mbaud to 1062 Mbaud and transmission distances from 1 to 10 km.",
    },
    {
      "id": 1,
      "word": "Fiber Distributed Data Interface network",
      "def":
          "A token-passing ring network designed specifically for fiber optics and featuring dual counterrotating rings and 100 Mbps operation.",
    },
    {
      "id": 1,
      "word": "Fiber Optic Cable",
      "def":
          "A transmission medium that uses glass or plastic fibers, rather than copper wire, to transport data or voice signals. The signals is imposed on the fiber via pulses (modulation) of light from a laser or a light-emitting diode (LED). Because of its high bandwidth and lack of susceptibility to interference, fiber-optic cable is used in long-haul or noisy applications.",
    },
    {
      "id": 1,
      "word": "Fiber Optics",
      "def":
          "A method for the transmission of information (sound, pictures, data). Light is modulated and transmitted over high purity, hair-thin fibers of glass. The bandwidth capacity of fiber optic cable is much greater than that of conventional cable or copper wire.",
    },
    {
      "id": 1,
      "word": "Fiber-Optic Interrepeater Link",
      "def":
          "A standard defining a fiber-optic link between two repeaters in an IEEE 802.3 network.",
    },
    {
      "id": 1,
      "word": "field",
      "def":
          "(1) A region containing electric or magnetic lines of force, or both. (2) A category of information in a computer file.",
    },
    {
      "id": 1,
      "word": "Field Effect Transistor",
      "def":
          "A three or more terminal transistor that consists of a channel and gate(s). At one end of the channel there is an electrode called the source, into which majority carriers flow from an external circuit. At the other end of the channel there is an electrode, called the drain, out of which electrons flow into the external circuit. Application of a voltage between the third terminal, known as the gate, and the source, establishes an electric field in the channel that changes the resistance between the source and drain, thereby changing the current that flows through the channel. In some FET's, there is another gate terminal which is independent of the first gate terminal.",
    },
    {
      "id": 1,
      "word": "Field Strength (H)",
      "def":
          "The parameter characterizing the amplitude of AC or DC field strength. The magnitude of current, number of turns, and winding geometry determine field strength.",
    },
    {
      "id": 1,
      "word": "file",
      "def":
          "An organized collection of information consisting of records. The records in a file may or may not be sequenced according to a key contained in each record.",
    },
    {
      "id": 1,
      "word": "file maintenance",
      "def":
          "The processing of a master file required to handle the nonperiodic changes in it. Examples: changes in number of dependents in a payroll file; the addition of new checking accounts in a bank.",
    },
    {
      "id": 1,
      "word": "filled cable",
      "def":
          "A telephone cable construction in which the cable core is filled with a material that will prevent moisture from entering or passing through the cable.",
    },
    {
      "id": 1,
      "word": "Filler",
      "def":
          "A material used in a cable construction to fill large interstices, thus providing a round construction; can be shaped, round, or in mastic forms. A nonfunctional member used in a cable to provide a more circular cross section.",
    },
    {
      "id": 1,
      "word": "film",
      "def":
          "(1) An adherent layer of a foreign substance on a contact surface. (2) IC Circuits formed directly on the insulating substrate. May be further modified as either thick-film or thin-film integrated circuits.",
    },
    {
      "id": 1,
      "word": "film resistors",
      "def":
          "A resistor in which the resistive material is a film over an insulating substrate. A resistor whose characteristics depend on film rather than bulk properties. The characteristics may be modified by either abrasive trim or laser trim techniques.",
    },
    {
      "id": 1,
      "word": "Filter",
      "def":
          "A circuit or device whose purpose is to control electrical energy at a given frequency or over a range of frequencies. Groups of passive components are commonly used to construct many types of filters, including resistors, capacitors, and inductors.",
    },
    {
      "id": 1,
      "word": "Fine Leak Test",
      "def":
          "A test performed on packaged semiconductors to determine the hermeticity of the package. Devices are immersed, under high pressure, in gaseous helium (He). They are placed in a vacuum chamber designed to detect the presence and amount of He. Packaged devices that have leak rates on the order of 10-8 cc/atm/sec or less are considered to be hermetic.",
    },
    {
      "id": 1,
      "word": "firmware",
      "def": "Software in hardware form, as, for example, BASIC in ROM.",
    },
    {
      "id": 1,
      "word": "fishpaper",
      "def":
          "A type of fiber paper used for insulating purposes where high mechanical strength is required.",
    },
    {
      "id": 1,
      "word": "Flag",
      "def":
          "Power switch output that provides the USB controller the power switch device status. When FLG = High, the output MOSFET allows power to flow from the supply rail.",
    },
    {
      "id": 1,
      "word": "Flag delay time",
      "def":
          "Design feature that delays the FLG notification signal in response to an abnormal condition (hot plug event, overcurrent surge, overtemperature condition). This feature minimizes unnecessary nuisance 'trips' caused by the inrush current of high capacitive loads.",
    },
    {
      "id": 1,
      "word": "flag terminal",
      "def":
          "A type of terminal having the tongue or body project at 90? from the side of the terminal barrel, rather than being in line with - and extending from - the end of the barrel.",
    },
    {
      "id": 1,
      "word": "flame resistance",
      "def":
          "The ability of material to extinguish flame once the source of heat is removed.",
    },
    {
      "id": 1,
      "word": "Flame Retardant",
      "def":
          "A descriptor applied to a material that has been made or treated so as to resist burning.",
    },
    {
      "id": 1,
      "word": "flame retardants",
      "def":
          "Either reactive compounds or additive compounds added to formulation to increase resistance to combustion. Reactive fire-retardant compounds become an integral part of the polymer structure, while additive fire-retardant chemicals are physically dispersed in the polymer.",
    },
    {
      "id": 1,
      "word": "Flame-resistant",
      "def":
          "A descriptor applied to a material that is inherently resistant to burning.",
    },
    {
      "id": 1,
      "word": "flammability",
      "def": "Measure of the material's ability to support combustion.",
    },
    {
      "id": 1,
      "word": "flange",
      "def":
          "A projection extending from - or around the periphery of - a connector, and having holes that provide for mounting the connector to a panel, or to a mating connector.",
    },
    {
      "id": 1,
      "word": "flash",
      "def":
          "A thin film of material formed at the sides of a forging, casting or molded part where some of the material is forced between the faces of the forging dies or the mold halves. Also the excess metal extruded between both halves of crimping dies when making certain circumferential or symmetrical crimps. Also would include a thin deposit of plastic material usually at the base of molded-in pins.",
    },
    {
      "id": 1,
      "word": "Flat Braid",
      "def": "A braided shield composed of flat strands.",
    },
    {
      "id": 1,
      "word": "Flat Cable",
      "def": "A cable with each component in a single, flat plane.",
    },
    {
      "id": 1,
      "word": "Flat Conductor",
      "def":
          "A conductor having a rectangular cross section, as opposed to a round or square cross section.",
    },
    {
      "id": 1,
      "word": "flat pack",
      "def":
          "(1) A housing for delicate semiconductors or IC's usually an alumina substrate although glass ceramic may be used. Thick film or thin film conductive paths on the ceramic connect the microcircuit active elements to the rest of the electronic system. (2) Any small, flat, square or rectangular integrated circuit packaged with leads coming from the sides of the package, in the same plane as the package.",
    },
    {
      "id": 1,
      "word": "Flatness",
      "def":
          "The variation in attenuation or gain at a given bias level over the frequency band of interest.",
    },
    {
      "id": 1,
      "word": "Flex Life",
      "def":
          "A measure of the susceptibility of a conductor or other device to failure due to fatigue from repeated bending.",
    },
    {
      "id": 1,
      "word": "flexibilizer",
      "def":
          "An additive that makes a resin or rubber more flexible. More commonly called plasticizer.",
    },
    {
      "id": 1,
      "word": "flexible substrate",
      "def":
          "Thick and thin film circuits have generally been deposited on rigid substrates, but it is possible to deposit these circuits on plastic substrates such as Kapton or Mylar which are flexible. Kapton and Mylar are trademarks.",
    },
    {
      "id": 1,
      "word": "flip-chip",
      "def":
          "A method of attaching a silicon chip in which the bonding pads and circuit are placed face down to contact pads on the substrate.",
    },
    {
      "id": 1,
      "word": "flip-flop",
      "def":
          "A basic digital building block that, at its simplest, uses two gates cross-coupled so that the output of one gate serves as the input of the other. It is capable of changing from one state to another on application of a control signal, but can remain in that state after the signal is removed. It thus serves as a basic storage element. Most flip-flops contain additional features to make them more versatile. Many digital circuits, such as registers and counters, are a number of flipflops connected together.",
    },
    {
      "id": 1,
      "word": "floating bushing",
      "def":
          "A design feature which aids in the alignment of plug and receptacle shells during a rack and panel type of engagement. The floating bushing is generally an eyelet-type bushing which is fitted and retained in the plug mounting holes. Even though mounting screws are passed through the bushings and fastened to a frame, the plug is still permitted freedom of motion in all directions in seeking out the mating receptacle.",
    },
    {
      "id": 1,
      "word": "floating ground",
      "def":
          "A grounding technique in which circuit grounds (return paths) are isolated from earth ground.",
    },
    {
      "id": 1,
      "word": "Floating Output",
      "def":
          "Converter output that ungrounded and not referenced to another output. Typically, floating outputs are fully isolated and may be referenced positive or negative by the user. Outputs that are not floating share common return and as such, are referenced to one another.",
    },
    {
      "id": 1,
      "word": "Flow Soldering",
      "def":
          "Flow Soldering is a tradename for specific wave soldering equipment manufactured by a company in England.",
    },
    {
      "id": 1,
      "word": "FLP",
      "def": "field labor provider",
    },
    {
      "id": 1,
      "word": "fluorocarbons",
      "def":
          "Resins which include fluorine in their molecular structure; the greater the fluorine content, the better are the polymer's electrical, mechanical, thermal, and chemical properties.",
    },
    {
      "id": 1,
      "word": "fluoroplastics",
      "def":
          "Polymers with monomers containing one or more atoms of fluorine or copolymers of such monomers.",
    },
    {
      "id": 1,
      "word": "Fluoropolymer",
      "def": "A polymer that contains atoms of fluorine.",
    },
    {
      "id": 1,
      "word": "Flux",
      "def":
          "(1) A liquid or solid that, when heated, exercises a cleaning and protective action upon surfaces. Used to promote or facilitate fusion during soldering or welding. (2) In magnetics, the magnetic field. Flux implies flow, which is not the case in magnetics. That is, no one has measured a magnetic 'flow'. Flux is represented conceptually as 'magnetic lines of force'. Flux density is measured in Gauss or Teslas. (3) Product of the average component of magnetic induction perpendicular to any given surface in a magnetic field by the area of that surface, expressed in webers.",
    },
    {
      "id": 1,
      "word": "Flux Density (B)",
      "def":
          "The corresponding parameter for the induced magnetic field in an area perpendicular to the flux path. Flux density is determined by the field strength and permeability of the medium in which it is measured.",
    },
    {
      "id": 1,
      "word": "Flux Transfer Ratio",
      "def":
          "The numeric amount of flux intercepted by the secondary winding and the total flux created by the applied ampere-turns.",
    },
    {
      "id": 1,
      "word": "Flyback",
      "def":
          "Actually an isolated storage inductor, a flyback transformer is a combination of an isolating transformer, output inductor, and flywheel diode. These use a gapped core and have a power handling capability of 100VA. Storing energy in the gap when the switch is on and delivering energy to the load when the switch is off, they do not perform like standard transformers.",
    },
    {
      "id": 1,
      "word": "Flyback Converter",
      "def":
          "Also called a 'buck-boost' converter, this topology typically uses a single transistor switch and eliminates the need for an output inductor. Energy is stored in the transformer primary during the first half of the switching period when the transistor switch is on. During the second half or 'flyback' period when the transistor is off, this energy is tranferred the transformer secondary and load. Also see Boost Regulator, Buck Regulator, Bridge Converter, Forward Converter, Push-Pull Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "Flyback Transformer",
      "def":
          "Transformer used in a flyback power supply. Also called horizontal output transformer.",
    },
    {
      "id": 1,
      "word": "FM",
      "def":
          "Frequency Modulation - A method of transmission in which the frequency of the carrier is varied in accordance to the signal.",
    },
    {
      "id": 1,
      "word": "FOIRL",
      "def": "Fiber-optic interrepeater link.",
    },
    {
      "id": 1,
      "word": "Foldback Current Limiting",
      "def":
          "Converter protection technique in which the circuit is protected under overload conditions by reducing the output current as the load approaches short circuit. This minimized internal power dissipation under short circuit conditions.",
    },
    {
      "id": 1,
      "word": "Forced Air Cooling",
      "def":
          "Use of a fan (or other air moving equipment) within a (sub) system to move air across heat producing components in order to reduce the ambient temperature. Also called forced convection.",
    },
    {
      "id": 1,
      "word": "FORTRAN",
      "def":
          "FORmula TRANslation. A computer-programming language designed mainly for scientific problems (expressed in algebraic notation).",
    },
    {
      "id": 1,
      "word": "Forward Bias",
      "def":
          "Bias voltage applied to a semiconductor PN junction in the direction that causes electrons to flow from the n-type (cathode) to the p-type (anode) regions.",
    },
    {
      "id": 1,
      "word": "Forward Converter",
      "def":
          "Also called a 'Buck-Derived' converter, this topology, like the flyback converter, typically uses a single transistor switch. Unlike the flyback converter, energy is tranferred to the transformer secondary while the transistor switch is 'on', and stoed in a output inductor. See Boost Regulator, Buck Regulator, Bridge Converter, Flyback Converter, Push Pull Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "Forward Converter Transformer",
      "def":
          "A transformer which operates by transferring power to the load during the on time and resetting in the off time. Since this transformer only transfers power during half of an input cycle it is required to be larger than a push-pull transformer for example.",
    },
    {
      "id": 1,
      "word": "FPGA",
      "def": "Field Programmable Gate Array",
    },
    {
      "id": 1,
      "word": "FQPSK",
      "def": "Filtered quadrature phase shift key modulation.",
    },
    {
      "id": 1,
      "word": "Fractional T1",
      "def":
          "A WAN communications service that provides the user with some portion of a T1 circuit which has been divided into 24 separate 64 kbps channels.",
    },
    {
      "id": 1,
      "word": "frame",
      "def":
          "The surrounding portion (usually metal) of a multiple contact connector having a removable module or insert. The frame supports the insert, and provides a method for mounting the connector to a panel or a mating connector. See also shell.",
    },
    {
      "id": 1,
      "word": "Frame Relay",
      "def":
          "A streamlined packet switching protocol designed to provide high-speed frame or packet switching with minimal delay and efficient bandwidth usage.",
    },
    {
      "id": 1,
      "word": "Free Convection",
      "def":
          "Operating environment where the natural movement of air (unassisted by fans or blowers) maintains the power module within its operating limits. Also called natural convection.",
    },
    {
      "id": 1,
      "word": "free hanging",
      "def":
          "A connector that is movable and not fixed to a board, panel, or frame. It will mate with another free-hanging connector or with a panelmount connector.",
    },
    {
      "id": 1,
      "word": "free standing",
      "def":
          "A contact/terminal installed on a pc board and used without a housing.",
    },
    {
      "id": 1,
      "word": "Frequency",
      "def":
          "The number of recurrences of a periodic phenomenon per unit time. In electronics, we refer to the frequency of electromagnetic radiation (radio waves) and alternating electrical current, which are periodic phenomena. The unit of frequency is the Hertz, abbreviated as 'Hz.' Formerly, the unit of frequency was known as cycles per second, abbreviated as 'cps.'",
    },
    {
      "id": 1,
      "word": "Frequency Band",
      "def":
          "Frequency range over which the performance or characteristics of a circuit, device or component are described or specified.",
    },
    {
      "id": 1,
      "word": "Frequency Conversion",
      "def": "The translation of a signal from one frequency to another.",
    },
    {
      "id": 1,
      "word": "Frequency Converter (or simply, Converter)",
      "def":
          "A device or circuit that performs frequency conversion, such as a mixer.",
    },
    {
      "id": 1,
      "word": "Frequency Modulation",
      "def":
          "the modification of the frequency of a higher frequency, constant magnitude carrier signal controlled by the amplitude and phase of a lower frequency baseband or audio signal.",
    },
    {
      "id": 1,
      "word": "Frequency Multiplication",
      "def": "The increase in frequency of a signal by an integral factor.",
    },
    {
      "id": 1,
      "word": "Frequency of Operation",
      "def": "See Switching Frequency",
    },
    {
      "id": 1,
      "word": "frequency response",
      "def":
          "The measure of how the gain or loss of a circuit, device, or system varies with frequency. Also called frequency characteristic, amplitude- frequency response, response, response characteristic, and sine-wave response.",
    },
    {
      "id": 1,
      "word": "frequency, voice",
      "def":
          "A frequency lying within that part of the audio range which is employed for speech transmission.. Note: Frequencies used for commercial transmission of speech usually lie within the range 200 to 3500 hertz (cps).",
    },
    {
      "id": 1,
      "word": "Fresnel reflection",
      "def":
          "The reflection that occurs at the planar junction of two materials having different refractive indices; Fresnel reflection is not a function of the angle of incidence.",
    },
    {
      "id": 1,
      "word": "Fresnel reflection loss",
      "def": "Loss of optical power due to Fresnel reflections.",
    },
    {
      "id": 1,
      "word": "fretting corrosion",
      "def":
          "A form of accelerated oxidation that occurs at the interface of contacting materials undergoing slight, cyclic relative motion. All non-noble metals (tin) are susceptible to some degree and will suffer contact resistance increases.",
    },
    {
      "id": 1,
      "word": "Fringing Fields or Fringing Flux",
      "def":
          "The field(s) associated with the divergence of the flux from the shortest path between poles in a magnetic circuit. Where flux passes through a high permeability into a lower permeability material, the flux redistributes and tends to have a 'barreling effect' between the two poles. See also leakage flux.",
    },
    {
      "id": 1,
      "word": "Front Release Contacts",
      "def":
          "Connector contacts that are released from the front side of the connector and then removed from the back, wire side of the connector.",
    },
    {
      "id": 1,
      "word": "front-mounted",
      "def":
          "A connector is said to be frontmounted when it is attached to the outside or mating side of a panel. A front-mounted connector can only be installed or removed from the outside of the equipment.",
    },
    {
      "id": 1,
      "word": "FSK",
      "def":
          "Frequency-shift keying. Used for transmitting digital data. Logic 1 is assigned to one frequency, and logic 0 to another. The two frequencies are then transmitted serially, and decoded into binary bits at the other end.",
    },
    {
      "id": 1,
      "word": "Full Bridge",
      "def":
          "Four power switches are used in a full bridge and usually utilize a single primary winding. Full supply voltage is obtained in both directions and utilizes the core and windings more effectively. Voltage on the switches does not exceed the supply voltage.",
    },
    {
      "id": 1,
      "word": "Full Bridge Converter",
      "def":
          "Converter topology that typically operates as forward converter but uses a bridge circuit, consisting of four switching transistors, to drive the transformer primary. Also see Bridge Converter.",
    },
    {
      "id": 1,
      "word": "Full Load",
      "def":
          "Maximum value of output load specified for a converter under continuous operating conditions.",
    },
    {
      "id": 1,
      "word": "Full Load Voltage",
      "def":
          "Variations in winding resistance, turns ratio, and leakage can cause minor discrepancies in output voltage, which is the full load voltage.",
    },
    {
      "id": 1,
      "word": "Full Recovery Temperature, Minimum",
      "def":
          "The minimum temperature required to fully shrink a product, that is, for the product to recover completely.",
    },
    {
      "id": 1,
      "word": "Full Winding",
      "def":
          "A winding for toroidal cores that will result in 45% of the core's inside diameter remaining.",
    },
    {
      "id": 1,
      "word": "Full-Wave Rectifier",
      "def":
          "The process of converting alternating current into a unidirectional current, by removing or inverting that part of the wave laying on one side of the zero amplitude axis. There are two general types of retificitaion processes, half-wave and full-wave.",
    },
    {
      "id": 1,
      "word": "function",
      "def":
          "Identifies the relationship within every combination of input conditions that will achieve one unique output. For example, in electronic circuits an 'AND function' will be achieved only if all inputs are valid.",
    },
    {
      "id": 1,
      "word": "Fundamental Frequency",
      "def": "The primary, lowest frequency component of a wave.",
    },
    {
      "id": 1,
      "word": "funnel entry",
      "def":
          "Flared or widened entrance to a terminal or contact wire barrel. Permits easier insertion of the conductor, and helps assure that all wire strands will be directed into the wire barrel.",
    },
    {
      "id": 1,
      "word": "Fuse",
      "def":
          "A type of overcurrent protection device that contains a metal wire which melts when too much current flows through it, thus breaking the circuit and protecting the circuit?s other components.",
    },
    {
      "id": 1,
      "word": "Fused coupler",
      "def":
          "A method of making a multimode or single-mode coupler by wrapping fibers together, heating them, and pulling them to form a central unified mass so that light on any input fiber is coupled to all output fibers.",
    },
    {
      "id": 1,
      "word": "GaAs Field Effect Transistor",
      "def": "A field effect transistor made with gallium arsenide.",
    },
    {
      "id": 1,
      "word": "gage element",
      "def":
          "Term used to designate the element of a gage which is accurately finished to size and is employed for size control. Example: A go no-go plug gage consists of a double-ended handle with a 'go' gage member on one end, and a 'no-go' gage member on the other. Also referred to as gage (or gaging) member",
    },
    {
      "id": 1,
      "word": "gage member",
      "def":
          "Term used to designate the element of a gage which is accurately finished to size and is employed for size control. Example: A go no-go plug gage consists of a double-ended handle with a 'go' gage member on one end, and a 'no-go' gage member on the other. Also referred to as gage (or gaging) element.",
    },
    {
      "id": 1,
      "word": "Gain",
      "def":
          "Gain is the ratio between the amplitude of the output signal of a device or circuit compared to the amplitude of the input signal. Gain is normally expressed in decibels (dB). A number of factors may affect the measured gain, so it is often necessary to specify the conditions or methods of measurement.",
    },
    {
      "id": 1,
      "word": "Gain Control",
      "def":
          "Part of an amplifier to which a control signal is applied to vary the gain of the amplifier. The ability to externally vary the gain of an amplifier.",
    },
    {
      "id": 1,
      "word": "galvanic corrosion",
      "def":
          "Electrical flow or chemical interaction caused by dissimilar materials (usually metal).",
    },
    {
      "id": 1,
      "word": "Ganged port protection",
      "def":
          "Protection method where one circuit protection device (or output) is used to protect more than one output port.",
    },
    {
      "id": 1,
      "word": "Gap loss",
      "def":
          "Loss resulting from the end separation of two axially aligned fibers.",
    },
    {
      "id": 1,
      "word": "garbage",
      "def":
          "Unwanted, incorrect, or meaningless information in memory, transmission media, or other electronic circuit.",
    },
    {
      "id": 1,
      "word": "GAST",
      "def": "Greenwich Sidereal Time Angle",
    },
    {
      "id": 1,
      "word": "gate",
      "def":
          "(1) A circuit having an output and one or more inputs, so designed that the output is energized when - and only when - a certain combination of inputs is energized. Used in digital computers. See also AND gate, logic gate, IGFET. (2) The terminal of a field effect transistor that controls the resistance of the channel through the application of an electric field established between the gate and the source as a result of an externally-applied voltage. The gate corresponds to the base of a bipolar transistor.",
    },
    {
      "id": 1,
      "word": "gate array",
      "def":
          "A type of integrated circuit that, by virtue of being partially fabricated, allows much shorter lead times in the design and production of custom circuits.",
    },
    {
      "id": 1,
      "word": "Gauge",
      "def": "A term used to denote the physical size of a wire. See also AWG.",
    },
    {
      "id": 1,
      "word": "Gauss",
      "def":
          "The CGS unit of measurement for flux density. One Gauss is equal to 1 Maxwell per cm2.",
    },
    {
      "id": 1,
      "word": "Gbps",
      "def": "A data rate. Gigabits per second.A gigabit is one billion bits.",
    },
    {
      "id": 1,
      "word": "GDOP",
      "def": "Geometric DOP",
    },
    {
      "id": 1,
      "word": "generator",
      "def":
          "A machine that converts mechanical energy into electrical energy.",
    },
    {
      "id": 1,
      "word": "GEO",
      "def":
          "Geostationary or Geosynchronous Earth Orbit (See also LEO &amp; MEO)",
    },
    {
      "id": 1,
      "word": "g-force",
      "def":
          "Gravitational acceleration of a freefalling body. Equal to 32.2 ft/sec2.",
    },
    {
      "id": 1,
      "word": "GGA",
      "def": "An NMEA message",
    },
    {
      "id": 1,
      "word": "giga",
      "def":
          "A prefix that indicates a factor of 109 (one billion), abbreviated as 'G.' Giga is a French prefix, and should be pronounced 'jeegah,' at least when in France.",
    },
    {
      "id": 1,
      "word": "Gigabit Ethernet",
      "def":
          "Transmission technology based on the Ethernet frame format and protocol used in local area networks (LANs), provides a data rate of 1 billion bits per second (one gigabit). Gigabit Ethernet is defined in the IEEE 802.3 standard and is currently being used as the backbone in many enterprise networks. Gigabit Ethernet is carried primarily on optical fiber (with very short distances possible on copper media). Existing Ethernet LANs with 10 and 100 Mbps cards can feed into a Gigabit Ethernet backbone. An alternative technology that competes with Gigabit Ethernet is ATM. A newer standard, 10-Gigabit Ethernet, is also becoming available. See 1000BASE-T also.",
    },
    {
      "id": 1,
      "word": "Gigabits Per Second (Gbps)",
      "def": "1,000,000,000 bits per second. A measure of transmission speed.",
    },
    {
      "id": 1,
      "word": "GIGO",
      "def":
          "From garbage in/garbage out, expressing that the quality of a computer depends on the quality of the programs and data used with it.",
    },
    {
      "id": 1,
      "word": "Gilbert",
      "def": "A unit of magnetomotive force in the CGS system.",
    },
    {
      "id": 1,
      "word": "GIS",
      "def": "Geographic Information System",
    },
    {
      "id": 1,
      "word": "Glass Microwave Integrated Circuit",
      "def":
          "GMIC - A technology invented and patented by M/A-COM to produce microwave integrated circuits, consisting of a glass wafer that is laminated to a silicon wafer. Various materials are deposited in succeeding layers on top of the glass wafer, which are then selectively removed using photolithographic masking and etching techniques to form lumped element and transmission line components. Semiconductor dice that contain discrete transistors, diodes or integrated circuits can be mounted on the GMIC substrate as required by the design.",
    },
    {
      "id": 1,
      "word": "GMIC",
      "def":
          "Glass Microwave Integrated Circuit - A technology invented and patented by M/A-COM to produce microwave integrated circuits, consisting of a glass wafer that is laminated to a silicon wafer. Various materials are deposited in succeeding layers on top of the glass wafer, which are then selectively removed using photolithographic masking and etching techniques to form lumped element and transmission line components. Semiconductor dice that contain discrete transistors, diodes or integrated circuits can be mounted on the GMIC substrate as required by the design.",
    },
    {
      "id": 1,
      "word": "GNSS",
      "def": "Global Navigation Satellite System",
    },
    {
      "id": 1,
      "word": "Government Rubber Synthetic",
      "def":
          "GRS - a government standard for Buna-S Rubber for jacketing and insulating compounds for military wires and cables.",
    },
    {
      "id": 1,
      "word": "GPRS",
      "def":
          "Generalized Packet Radio Service. (A GSM-based packet data protocol)",
    },
    {
      "id": 1,
      "word": "GPS",
      "def": "Global Positioning System",
    },
    {
      "id": 1,
      "word": "Graded Cores",
      "def":
          "MPP and HF cores are graded into increments of permeability within their normal ?8% tolerance. It is expressed as a percent deviation from the nominal value.",
    },
    {
      "id": 1,
      "word": "graded index fiber",
      "def":
          "An optical fiber whose core has a nonuniform index of refraction. The differences in the refractive index reduce signal spreading caused by modal dispersion.",
    },
    {
      "id": 1,
      "word": "Graded-index fiber",
      "def":
          "An optical fiber whose core has a nonuniform index of refraction. The core is composed of concentric rings of glass whose refractive indices decrease from the center axis. The purpose is to reduce modal dispersion and thereby increase fiber bandwidth.",
    },
    {
      "id": 1,
      "word": "Grain Oriented",
      "def":
          "Silicon steel or other granular magnetic material that has a preferred direction of magnetization.",
    },
    {
      "id": 1,
      "word": "Gray code",
      "def":
          "The mirror image of the binary counting code which changes one bit at a time when increasing or decreasing by one.",
    },
    {
      "id": 1,
      "word": "green ceramic",
      "def": "Generally refers to unfired ceramic.",
    },
    {
      "id": 1,
      "word": "grid",
      "def":
          "A two-dimensional network consisting of a set of equally spaced parallel lines superimposed upon another set of equally spaced parallel lines so that the lines of one set are perpendicular to the lines of the other, thereby forming square areas. The intersections of the lines provide the basis for an incremental location system. Also called matrix.",
    },
    {
      "id": 1,
      "word": "grid-spaced",
      "def": "Equally spaced in a rectangular pattern.",
    },
    {
      "id": 1,
      "word": "grommet",
      "def":
          "A rubber seal used on the cable side of a multiple-contact connector to seal the connector against moisture, dirt, or air.",
    },
    {
      "id": 1,
      "word": "ground",
      "def":
          "A connection - intentional or accidental - between an electrical circuit and the earth, or some conducting body (eg chassis) serving in place of the earth. Also, reference level for signals.",
    },
    {
      "id": 1,
      "word": "Ground fault",
      "def":
          "A type of overcurrent event that occurs due to momentary, usually accidental, grounding of a conducting wire.",
    },
    {
      "id": 1,
      "word": "Ground Loop",
      "def":
          "Condition caused when two or more system components share a common electrical ground line. A feedback loop is unintentionally induced, causing unwanted voltage levels.",
    },
    {
      "id": 1,
      "word": "ground loop noise",
      "def":
          "Noise that results when different points of a grounding system are at different potentials and thereby create an unintended current path.",
    },
    {
      "id": 1,
      "word": "Ground Plane",
      "def": "A copper plane connected to ground",
    },
    {
      "id": 1,
      "word": "Grounding Conductor",
      "def":
          "A conductor that provides a current return path from an electrical device to ground.",
    },
    {
      "id": 1,
      "word": "Ground-loop noise",
      "def":
          "Noise that results when equipment is grounded at ground points having different potentials and thereby creating an unintended current path. The dielectric of optical fibers provides electrical isolation that eliminates ground loops.",
    },
    {
      "id": 1,
      "word": "Group Delay",
      "def":
          "The first derivative of the phase versus frequency response of a network, component, or transmission line.",
    },
    {
      "id": 1,
      "word": "GSA",
      "def": "An NMEA message",
    },
    {
      "id": 1,
      "word": "GSM",
      "def":
          "Global System for Mobile Communication. The world's most widely used mobile system, based primarily on TDMA transmission, operating around 900 MHz or 1800 MHz in Europe, Asia and Australia, and around 1800 MHz in the Americas. (See also TDMA, CDMA, and PCS)",
    },
    {
      "id": 1,
      "word": "GSV",
      "def": "An NMEA message",
    },
    {
      "id": 1,
      "word": "guard band",
      "def":
          "The unused area which serves to isolate elements in a printed circuit. Examples: area between printed circuit paths; area between an element and the edge of the mounting base.",
    },
    {
      "id": 1,
      "word": "guide pin and socket",
      "def":
          "A device which provides alignment between mating connectors during engagement. May also be used to provide polarization and/or keying and to prevent damage to the contacts caused by mismating of the connectors.",
    },
    {
      "id": 1,
      "word": "Gunn Effect",
      "def":
          "In some materials (III-V compounds such as GaAs and InP), after an electric field in the material reaches a threshold level, the mobility of electrons decrease as the electric field is increased, thereby producing negative resistance. A two-terminal device made from such a material can produce microwave oscillations, the frequency of which is primarily determined by the characteristics of the specimen of the material and not by any external circuit. The Gunn Effect was discovered by J. B. Gunn of IBM in 1963.",
    },
    {
      "id": 1,
      "word": "H",
      "def": "Henry - the unit for inductance.",
    },
    {
      "id": 1,
      "word": "h Parameters",
      "def":
          "The set of parameters for a two port device that relates the input voltage and current to the output current and voltage.",
    },
    {
      "id": 1,
      "word": "Half Bridge",
      "def":
          "A dual, forward converter, using two power switches can also be called a half bridge. Power, which does not exceed the supply voltage, is delivered to the load only during half the input cycle. This design permits the use of a smaller transformer.",
    },
    {
      "id": 1,
      "word": "Half Bridge Converter",
      "def":
          "Converter topology that typically operates as a forward converter but uses a bridge circuit, consisting of two switching transistors, to drive the transformer. Also see Bridge Converter.",
    },
    {
      "id": 1,
      "word": "Half-Wave Rectifier",
      "def":
          "The process of converting alternating current into a unidirectional current, by removing or inverting that part of the wave laying on one side of the zero amplitude axis. There are two general types of retificitaion processes, half-wave and full-wave.",
    },
    {
      "id": 1,
      "word": "Hall effect",
      "def":
          "The Hall effect occurs when a magnetic field is applied to a currentcarrying semiconductor chip; it creates a voltage perpendicular to both the direction of current and the magnetic field. This means that moving the magnetic field in relation to the chip can control the output of the chip. The effect is used to make switches and sensors.",
    },
    {
      "id": 1,
      "word": "Hall Effect Transducer",
      "def":
          "A device that produces a voltage output dependent upon an applied DC voltage and an incident magnetic field. The magnitude of the output is a function of the field strength and the angle of incidence with the Hall device.",
    },
    {
      "id": 1,
      "word": "handshake",
      "def":
          "A multistep connection routine. A verification by the central processing unit that a computer data terminal has correctly identified itself, and all systems are ready to initiate communication.",
    },
    {
      "id": 1,
      "word": "hard copy",
      "def":
          "Any form of computer-produced printed document. Also, human-readable typewritten or printed characters produced on paper at the same time that information is being keyboarded in a coded machine language, as when punching cards or paper tape. Where point-of-sale purchases are processed by computer, the data would appear on the receipt form (hard copy) while also being transmitted to the computer for processing.",
    },
    {
      "id": 1,
      "word": "Hard Magnetic Material",
      "def":
          "A 'permanent' magnet material that has an intrinsic coercivity generally greater than or equal to about 300 Oersteds.",
    },
    {
      "id": 1,
      "word": "Hardness",
      "def":
          "A general term that correlates with strength, rigidity, and resistance to abrasion or penetration. Measured on Shore or Rockwell scales. See also Shore.",
    },
    {
      "id": 1,
      "word": "hardware",
      "def":
          "(1) The shells, guide pins, locking springs, jackscrews, strain relief clamps, shields, mounting screws, and other devices which may be added to a connector to make it acceptable for a particular function. (2) The mechanical, magnetic, electrical, and electronic devices from which a computer is built.",
    },
    {
      "id": 1,
      "word": "Harmonic Content",
      "def":
          "The degree of distortion in a signal due to the presence of harmonics.",
    },
    {
      "id": 1,
      "word": "Harmonics",
      "def":
          "Energy at integral multiples of the frequency of the fundamental signal. Normally expressed as THD (Total Harmonic Distortion) but can be specified for harmonics of interest in either a percentage of or decibels below the power level of the fundamental frequency signal.",
    },
    {
      "id": 1,
      "word": "harness",
      "def":
          "A wire assembly involving two or more wires that are prepared and ready for installation into a unit or system.",
    },
    {
      "id": 1,
      "word": "HDOP",
      "def": "Horizontal DOP",
    },
    {
      "id": 1,
      "word": "HDSL",
      "def":
          "High-bit-rate Digital Subscriber Line- Designed to be a cost-effective method of delivering T1/E1 line speeds over unconditioned copper cable, without the use of repeaters.",
    },
    {
      "id": 1,
      "word": "Headend",
      "def":
          "The source end of a coaxial cable TV system. Often, the site for signal processing equipment essential to proper functioning of a cable system.",
    },
    {
      "id": 1,
      "word": "header",
      "def":
          "The base or mounting plate of an electronic package to which chips and leads are attached.",
    },
    {
      "id": 1,
      "word": "Heat Aging",
      "def":
          "A test that subjects components or materials to temperatures above normal operating values to evaluate changes in performance in order to predict service life. See also Accelerated Aging.",
    },
    {
      "id": 1,
      "word": "Heat Flux",
      "def":
          "Flow rate of heat across or through a material, typically given in W/cm2",
    },
    {
      "id": 1,
      "word": "heat guns",
      "def":
          "Heat producing devices used for softening, curing, drying, preheating, and welding of plastics, coatings, and compounds as well as shrinking of heat-shrinkable plastic tubing and plastic films.",
    },
    {
      "id": 1,
      "word": "heat resistant",
      "def": "A copper or brass terminal nickel plated to withstand 650?F.",
    },
    {
      "id": 1,
      "word": "Heat Shock",
      "def":
          "A test to determine the stability of a material by continuously exposing it to an extremely high temperature for a short period of time. The test was developed both to demonstrate that the material is crosslinked and to observe any problems in dripping, cracking, or flowing.",
    },
    {
      "id": 1,
      "word": "Heat Sink",
      "def":
          "A structure that is mechanically attached to a device that generates heat, in order to lower the overall thermal impedance between the point source of the heat within the device and its cooler surroundings.",
    },
    {
      "id": 1,
      "word": "heat sink tab",
      "def":
          "A mechanical tab on an integrated circuit package for attachment to a heat sink.",
    },
    {
      "id": 1,
      "word": "heat-shrinkable",
      "def":
          "A type of plastic material that has been cross-linked. A term describing tubes, sleeves, caps, boots, films, or other forms of plastic which shrink to encapsulate, protect, or insulate connections, splices, terminations, and other configurations.",
    },
    {
      "id": 1,
      "word": "Heat-Shrinkable Material",
      "def":
          "A polymeric material capable of being reduced in size when exposed to heat.",
    },
    {
      "id": 1,
      "word": "hecto",
      "def": "A prefix that indicates a factor 102, abbreviated as 'h'.",
    },
    {
      "id": 1,
      "word": "Henry",
      "def": "H - The unit for inductance.",
    },
    {
      "id": 1,
      "word": "hermaphroditic connector",
      "def":
          "A connector in which both mating members are exactly alike at their mating face.",
    },
    {
      "id": 1,
      "word": "hermaphroditic contact",
      "def":
          "A contact design which mates with another contact of the same design.",
    },
    {
      "id": 1,
      "word": "hermetic",
      "def":
          "Airtight, impervious to external influence, as in a hermetic package. Often used to describe metal-to-metal solder or weld sealed packages. In reality all materials are permeable, hence specifications define acceptable levels of hermeticity.",
    },
    {
      "id": 1,
      "word": "hermetic seal",
      "def":
          "Hermetically sealed connectors are usually multiple contact connectors where the contacts are bonded to the connector by glass or other materials and permit a maximum leakage rate of gas through the connector of 1.0 micron ft/hr at one atmosphere pressure for special applications. Maximum leakage rates below 1.0 can be specified.",
    },
    {
      "id": 1,
      "word": "Hermeticity",
      "def": "The extent to which a seal is hermetic.",
    },
    {
      "id": 1,
      "word": "hertz",
      "def":
          "Term for cycles per second by international standard, adopted and now common in U.S. From the German physicist's name, Heinrich R. Hertz. In use we find that 60 cycles/second (or 60 cps) becomes 60 hertz (or 60Hz).",
    },
    {
      "id": 1,
      "word": "Heterolithic Microwave Integrated Circuit'",
      "def":
          "A microwave integrated circuit that consists of silicon and glass, typically known as an 'HMIC'.' This technology was invented and patented by M/A-COM. An HMIC consists of pedestals of Si embedded in glass. The Si pedestals may act as conductive vias from the top of the die to the bottom of the die, or there may be diodes formed at the tops of the pedestals. Conductor can be deposited on top of the glass to form transmission lines or lumped elements, such as spiral inductors, baluns or MIM capacitors.",
    },
    {
      "id": 1,
      "word": "hexadecimal numbering system",
      "def":
          "A numbering system with the base 16. The digits of the system are 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, and F.",
    },
    {
      "id": 1,
      "word": "HFC",
      "def": "hybrid fiber-coaxial",
    },
    {
      "id": 1,
      "word": "hi temp",
      "def":
          "A terminal designed to withstand extremely high temperatures; usually made from nickel and/or nickel alloys. AMP STRATOTHERM* terminals and splices, rated at 1200?F, are excellent examples of 'hi temp' product.",
    },
    {
      "id": 1,
      "word": "Hiccup Mode",
      "def":
          "Operating mode triggered by an output fault condition (short-circuit)in which the converter cycles on and off the duty cycle of on time to off time maintains the interenal power dissipation at a safe level until the fault condition is corrected.",
    },
    {
      "id": 1,
      "word": "High Line",
      "def":
          "Maximum value of input line voltage specified for normal converter operaton. Also see Low Line and Input Voltage Range.",
    },
    {
      "id": 1,
      "word": "High Pass Filter",
      "def":
          "HPF - A reactive circuit that rejects signals whose frequencies are below the 3 dB point frequency and passes signals whose frequencies are above the 3 dB point frequency.",
    },
    {
      "id": 1,
      "word": "High Potential Test (Hi-Pot Test)",
      "def":
          "Test used to determine whether a converter passes its miminum breakdown voltage specification. Also see Breakdown Voltage.",
    },
    {
      "id": 1,
      "word": "High Q Filters",
      "def":
          "A filter circuit that exhibits a high Q factor. It is very frequency sensitive and filters out or allows to pass, only those frequencies within a narrow band.",
    },
    {
      "id": 1,
      "word": "high voltage",
      "def":
          "Generally considered to be a wire or cable with an operating voltage of over 600 volts. Also called high tension.",
    },
    {
      "id": 1,
      "word": "high-density polyethylene",
      "def":
          "Those polyethylenes whose density ranges about .94 to .96 and above. They are linked in longer chains, forming a more rigid resin material.",
    },
    {
      "id": 1,
      "word": "high-level logic",
      "def":
          "Also HI level. In digital logic, the more positive of the two logic levels in a binary system. Normally, a high logic level is used to represent a binary 1 or true condition. See also low-level logic, negative logic, and positive logic.",
    },
    {
      "id": 1,
      "word": "high-speed socket",
      "def":
          "A ceramic chip carrier socket for highpincount circuits of up to 164 contacts on .020in. centerlines. Highspeed refers to the short electrical length of the contacts.",
    },
    {
      "id": 1,
      "word": "Hi-Rel Screening",
      "def":
          "Regimen of testing intended to induce latent infant mortality failures in a semiconductor lot in order to insure that the surviving devices will operate as predicted by mean-time-before-failure for the device type.",
    },
    {
      "id": 1,
      "word": "HMIC",
      "def": "Heterolithic Microwave Integrated Circuit",
    },
    {
      "id": 1,
      "word": "Hold Current",
      "def":
          "(1) The largest steady state current that, under specified ambient conditions, can be passed through a PolySwitch device without causing the device to trip. For SiBar devices, the current at which the device resets to a high-impedance state once the surge current dissipates. (2) The minimum current which will keep the contact springs in a relay energized. Also called the electrical hold value.",
    },
    {
      "id": 1,
      "word": "Hold Current Minimum",
      "def":
          "The minimum current required to maintain the device in the on-state. For SiBar thyristors, the current at which the device resets to a high-impedance state once the surge current dissipates.",
    },
    {
      "id": 1,
      "word": "Hold Voltage",
      "def":
          "The lowest voltage that can be applied without any change in state of the contacts from their energized position. This is just above the maximum drop-out voltage. Leakage Current The rms current conducted by the output circuit of the relay at maximum rated voltage with the contacts open.",
    },
    {
      "id": 1,
      "word": "holding strength",
      "def":
          "Ability of a connector to remain assembled to a cable when under tension.",
    },
    {
      "id": 1,
      "word": "Hold-Up Time",
      "def":
          "Period of time that a converter output remains operating within specification following the loss of input power. This is a more common specificatioin for AC/DC supplies.",
    },
    {
      "id": 1,
      "word": "Hole",
      "def":
          "The term used to describe the conceptual positive charge carrier. A hole is actually a vacancy in the valance band of an otherwise electrically neutral atom, thereby resulting in a positive ion. The charge of a single hole is (+)1.6 * 10-19 coulombs.",
    },
    {
      "id": 1,
      "word": "hole conduction",
      "def":
          "The apparent movement of a hole to the more negative terminal in a semiconductor. Since the hole is positive, this movement is equivalent to a flow of positive charges in that direction.",
    },
    {
      "id": 1,
      "word": "holes",
      "def":
          "Holes can be made in the ceramic prior to or after firing. The post-firing process is relatively costly, but affords much greater accuracy of location than does the punching operation used on the green ceramic.",
    },
    {
      "id": 1,
      "word": "Hollerith",
      "def": "A 12-bit code used for recording characters in punched cards.",
    },
    {
      "id": 1,
      "word": "hook tongue",
      "def":
          "A terminal with a tongue that is open from the side rather than from the end.",
    },
    {
      "id": 1,
      "word": "Hookup Wire and Cable",
      "def": "Wiring used to connect various points in electronic assemblies.",
    },
    {
      "id": 1,
      "word": "Horizontal cabling",
      "def":
          "Includes the work area outlet, distribution cable and connecting hardware in the telecom closet.",
    },
    {
      "id": 1,
      "word": "hot melts",
      "def":
          "Adhesives or other thermoplastic materials used for production bonding. A mechanical bond is formed when the material cools.",
    },
    {
      "id": 1,
      "word": "Hot Plug-In",
      "def":
          "A common requriement in distributed power systems wherein the power board must be capable of being connected/disconnected from the power bus without damage. Power board components must be protected against the resultant high inrush currents.",
    },
    {
      "id": 1,
      "word": "Hot-Melt Adhesive",
      "def":
          "An adhesive that becomes activated by heating. When heated, it melts, flows over the substrate surface, and forms an adhesive bond. Reheating causes the adhesive to remelt.",
    },
    {
      "id": 1,
      "word": "Hot-Plug",
      "def":
          "The act of making a connection to the output port of a functioning peripheral or host. USB architecture is designed to recognize the connected function and 'enable' it by providing necessary power and loading all necessary drivers.",
    },
    {
      "id": 1,
      "word": "housing",
      "def":
          "An insulating encapsulation for contacts. When pins or sockets are inserted into a housing, the assembly is usually referred to as a connector. Housing is sometimes referred to as 'block.'",
    },
    {
      "id": 1,
      "word": "HPF",
      "def":
          "High Pass Filter - A reactive circuit that rejects signals whose frequencies are below the 3 dB point frequency and passes signals whose frequencies are above the 3 dB point frequency.",
    },
    {
      "id": 1,
      "word": "Hub",
      "def":
          "Class of USB equipment that attaches to the Host and provides additional USB output connections for other hubs or functions. May be classified as self-powered hubs or bus-and self-powered hubs.",
    },
    {
      "id": 1,
      "word": "Humidity Aging Test",
      "def":
          "A test described in Raychem's PS300 publication in which the resistance of a PolySwitch device at room temperature is measured before and after aging at an elevated temperature (e.g., 40?C) and high humidity (e.g., 95% RH) for an extended time (e.g., 1000 hours).",
    },
    {
      "id": 1,
      "word": "Humidity Aging Test",
      "def":
          "A test described in Raychem's PS300 publication in which the resistance of a PolySwitch device at room temperature is measured before and after aging at an elevated temperature (e.g., 40?C) and high humidity (e.g., 95% RH) for an extended time (e.g., 1000 hours).",
    },
    {
      "id": 1,
      "word": "hybrid",
      "def":
          "A blend or composite of two different technologies. The context defines the technologies.",
    },
    {
      "id": 1,
      "word": "hybrid IC",
      "def":
          "A composite of either monolithic integrated circuits, or discrete semiconductor device circuits, in a unit packaging configuration.",
    },
    {
      "id": 1,
      "word": "hygroscopic",
      "def": "Capable of absorbing moisture from the air.",
    },
    {
      "id": 1,
      "word": "Hysteresis and Hysteresis Loss",
      "def":
          "Hysteresis means to lag behind. This is the tendency of a magnetic material to retain its magnetization. Hysteresis causes the graph of magnetic flux density versus magnetizing force (B-H curve) to form a loop rather than a line. The area of the loop represents the difference between energy stored and energy released per unit of volume of material per cycle. This difference is called the hysteresis loss.",
    },
    {
      "id": 1,
      "word": "Hysteresis Loop",
      "def":
          "A closed curve obtained for a material by plotting corresponding values of flux density for the ordinate and magnetizing force for the abscissa when the material is passing through a complete cycle between definite limits of either magnetizing force or flux density. If the material is not driven into saturation it is said to be on a minor loop.",
    },
    {
      "id": 1,
      "word": "Hz",
      "def": "Hertz - A measure of frequency equal to one cycle per second.",
    },
    {
      "id": 1,
      "word": "I",
      "def": "Symbol used to designate current.",
    },
    {
      "id": 1,
      "word": "I/O",
      "def":
          "Pertaining to the equipment used to communicate with a computer and the data involved.",
    },
    {
      "id": 1,
      "word": "I/O limited",
      "def":
          "Pertaining to a computer in which the speed of computer processing is limited by the speed of the input and/or output equipment.",
    },
    {
      "id": 1,
      "word": "IAD",
      "def": "integrated access devices",
    },
    {
      "id": 1,
      "word": "IC",
      "def": "Integrated Circuit",
    },
    {
      "id": 1,
      "word": "ICP",
      "def": "integrated communication provider",
    },
    {
      "id": 1,
      "word": "ID",
      "def":
          "Internal Diameter or Inside Diameter - The inside or internal diameter of a tubing.",
    },
    {
      "id": 1,
      "word": "IDC",
      "def":
          "Insulation Displacement Connector. A style of connector that slices through the cable insulation to make a connection.Eliminates the need to strip insulation.",
    },
    {
      "id": 1,
      "word": "identifier",
      "def":
          "A symbol whose purpose is to identify, indicate, or name a body of data.",
    },
    {
      "id": 1,
      "word": "IDP",
      "def": "Integrated detector/preamplifier.",
    },
    {
      "id": 1,
      "word": "IDSL",
      "def": "ISDN digital subscriber line",
    },
    {
      "id": 1,
      "word": "IEC",
      "def": "International Electrotechnical Commission.",
    },
    {
      "id": 1,
      "word": "IEEE",
      "def":
          "Institute of Electrical and Electronics Engineers. 802 Group develops Local Area Network standards and Metropolitan Area Network standards.",
    },
    {
      "id": 1,
      "word": "IEEE 488",
      "def":
          "An interface for interconnecting programmable digital instruments.",
    },
    {
      "id": 1,
      "word": "IEEE 802.3",
      "def": "Usually referred to as Ethernet. A networking protocol.",
    },
    {
      "id": 1,
      "word": "IEEE 802.5",
      "def": "Usually referred to as token ring. A networking protocol.",
    },
    {
      "id": 1,
      "word": "IF",
      "def": "intermediate frequency",
    },
    {
      "id": 1,
      "word": "IF Bandwidth",
      "def":
          "The frequency interval in a receiver over which the amplifiers, filters and other components that process the IF are deigned to operate.",
    },
    {
      "id": 1,
      "word": "IF Impedance",
      "def":
          "The average of the time varying impedance of a mixer diode at some nominal IF frequency (usually 30 MHz). It is measured with an admittance bridge at a constant rectified current (normally 1 mA) produced by the LO signal. Most Schottky diodes will have IF impedances in the range of 150 - 400 ohms at 1 mA.",
    },
    {
      "id": 1,
      "word": "IGFET",
      "def":
          "Insulated-gate field-effect transistor. A general term lumping together all field-effect transistors having insulated gates regardless of fabrication process.",
    },
    {
      "id": 1,
      "word": "IH",
      "def":
          "The largest steady state current that, under specified ambient conditions, can be passed through a PolySwitch device without causing the device to trip. For SiBar devices, the current at which the device resets to a high-impedance state once the surge current dissipates. See also Hold Current.",
    },
    {
      "id": 1,
      "word": "IHOLD",
      "def":
          "The largest steady state current that, under specified ambient conditions, can be passed through a PolySwitch device without causing the device to trip. For SiBar devices, the current at which the device resets to a high-impedance state once the surge current dissipates. See also Hold Current.",
    },
    {
      "id": 1,
      "word": "IIL",
      "def":
          "I2L or Integrated-injection logic - A logic family in which gates consist essentially of only one transistor. Offers speeds comparable to TTL and packaging density and power consumption comparable to MOS.",
    },
    {
      "id": 1,
      "word": "ILEC",
      "def": "incumbent local exchange carriers (formerly RBOC)",
    },
    {
      "id": 1,
      "word": "Image Frequency",
      "def":
          "The frequency of an unwanted signal that may be incident on a down converter mixer that can produce the same IF as the desired signal. For example, if the desired frequency is 2 GHz and the LO frequency is 1.9 GHz, the image frequency is 1.8 GHz since the differences between 2.0 GHz and 1.9 GHz and between 1.9 GHz and 1.8 GHz are both 100 MHz.",
    },
    {
      "id": 1,
      "word": "Image Rejection Mixer",
      "def":
          "A mixer that is designed to reject signal at the image frequency.",
    },
    {
      "id": 1,
      "word": "Imax",
      "def":
          "The highest fault current that can safely be used to trip a PolySwitch device under specified conditions. Typically the lower the voltage dropped across the PolySwitch device in its tripped state, the higher the maximum interrupt current. Maximum interrupt currents are usually shown in this Databook at the maximum voltage. It may be possible to use a PolySwitch device at a higher interrupt current, but each such use must be individually qualified.",
    },
    {
      "id": 1,
      "word": "IMPATT",
      "def":
          "Acronym for 'Impact Avalanche Transition Time', which describes a class of semiconductor devices that can produce negative resistance. An IMPATT diode typically consists of 4 layers: N+-p-i-p+ or p+-n-i-n+. In either case, when the p-n junction is under avalanche, there is a 90? phase shift between the resultant AC voltage across and current through the junction. The thickness of the I layer is designed to provide an additional 90? phase shift, thereby totaling 180?.",
    },
    {
      "id": 1,
      "word": "Impedance",
      "def":
          "The total opposition offered by a component or circuit to the flow of alternating or varying current at a particular frequency, including both the AC and DC component.. Impedance is expressed in ohms and is similar to the actual resistance in a direct current circuit. In computations, impedance is handled as a complex ratio of voltage to current. The ohm is the unit of impedance. Impedance is typically abbreviated as 'z' or 'Z'. The frequency-invariant, real component of impedance is resistance. The frequency-variant, imaginary component of impedance is reactance. The reciprocal of impedance is admittance.",
    },
    {
      "id": 1,
      "word": "impedance match",
      "def":
          "The condition in which the impedance of a component or circuit is equal to the internal impedance of the source, or the surge impedance of a transmission line, thereby giving maximum transfer of energy from source to load, minimum reflection, and minimum distortion.",
    },
    {
      "id": 1,
      "word": "Impedance Matching",
      "def":
          "The act of designing a circuit such that if the circuit is opened at any point, the impedance measured in either of the two resulting branches is equal. Maximum power is transferred through a circuit when impedances are matched.",
    },
    {
      "id": 1,
      "word": "Imperial Wire Gauge",
      "def":
          "A modification of the Birmingham Wire Gauge and the legal standard of Great Britain for all wires. It is variously known as Standard Wire Gauge (SWG), New British Standard (NBS), English Legal Standard, and Imperial Wire Gauge.",
    },
    {
      "id": 1,
      "word": "impregnate",
      "def":
          "To fill the voids and interstices of a material with a compound. This does not imply complete fill or complete coating of the surfaces by a hole-free film.",
    },
    {
      "id": 1,
      "word": "Impulse Test",
      "def":
          "A high-voltage test designed to locate pinholes in the insulation of a wire or cable by applying a voltage while the wire or cable is being drawn through an electrode.",
    },
    {
      "id": 1,
      "word": "In Phase",
      "def":
          "When two or more periodic, time-varying waveforms are simultaneously at the same phase angle and trending in the same direction.",
    },
    {
      "id": 1,
      "word": "Incident Wave",
      "def": "The wave front that impinges upon a device",
    },
    {
      "id": 1,
      "word": "Incremental Current",
      "def":
          "The DC bias current flowing through the inductor which causes an inductance drop of 5% from the initial zero DC bias inductance value. This current level indiciates where the inductance can be expected to drop significantly if the DC bias current is increased further. This applies mostly to ferrite cores in lieu of powdered iron. Powdered iron cores exhibit 'soft' saturation characteristics. this means their inductance drop from higher DC levels is much more gradual than ferrite cores. The rate at which the inductance will drop is also a function of the core shape, i.e. air gap (Also see Saturation Current).",
    },
    {
      "id": 1,
      "word": "Incremental Permeability (?inc)",
      "def":
          "The permeability of a magnetic material about a specified operating point and applied magnetic field strength, especially under DC bias conditions. The incremental permeability is expressed as the slope of the B-H characteristic about the given operating point (dB/dH).",
    },
    {
      "id": 1,
      "word": "Index of refraction",
      "def":
          "The ratio of the velocity of light in free space to the velocity of light in a given material. Symbolized by n.",
    },
    {
      "id": 1,
      "word": "Index-matching material",
      "def":
          "A material, used at optical interconnection, having a refractive index close to that of the fiber core and used to reduce Fresnel reflections.",
    },
    {
      "id": 1,
      "word": "Individual Port Protection",
      "def":
          "Protection method where each output is protected by one circuit protection device (or output). For devices with multiple outputs per device, isolation is provided so that a port can respond to a fault condition without impacting the performance of the other port(s).",
    },
    {
      "id": 1,
      "word": "Inductance",
      "def":
          "That property of a circuit element which tends to oppose any change in the current flowing through it. The inductance for a given inductor is influenced by the core material, core shape and size, the turns count of the coil, and the shape of the coil. Inductors most often have their inductance values expressed in microHenries (?H) or milliHenries (mH). The schematic representation of inductance is designated as 'L.'",
    },
    {
      "id": 1,
      "word": "Inductance Factor (AL)",
      "def":
          "The inductance rating of a core in nanoHenries per turn squared (nH/N2) based on a peak flux density of 10 gauss (1 milliTesla) at a frequency of 10 kHz. An AL value of 40 would produce 400?H of inductance for 100 turns and 40mH for 1000 turns.",
    },
    {
      "id": 1,
      "word": "induction generator",
      "def":
          "An induction generator is an induction machine, driven above synchronous speed by an external source of mechanical power.",
    },
    {
      "id": 1,
      "word": "induction motor",
      "def":
          "An induction machine which converts electric power, delivered to the primary circuit, into mechanical power.",
    },
    {
      "id": 1,
      "word": "inductive coupling",
      "def":
          "The coupling of energy from one circuit to another that results from the magnetic field generated by the source conductor.",
    },
    {
      "id": 1,
      "word": "Inductive Reactance",
      "def":
          "The opposition to alternating current flow presented by a capacitance. The symbol for capacitive reactance is XC. The unit is the ohm. The formula for capacitive reactance is XL = 2?fL, where f is the frequency of the alternating current signal, and L is the inductance.",
    },
    {
      "id": 1,
      "word": "Inductor",
      "def":
          "A passive component designed to resist changes in current. Inductors arc often referred to as AC Resistors. The ability to resist changes in current and the ability to store energy in its magnetic field account for the bulk of the useful properties of inductors. Current passing through an inductor will produce a magnetic field. A changing magnetic field induces a voltage which opposes the field-producing current. This property of impeding changes in current is known as inductance. The voltage induced across an inductor by a change of current is defined as: V",
    },
    {
      "id": 1,
      "word": "information channel",
      "def":
          "The transmission and intervening equipment involved in the transfer of information in a given direction between two terminals. An information channel includes the modulator and demodulator, and any error-control equipment irrespective of its location, as well as the backward channel when provided.",
    },
    {
      "id": 1,
      "word": "inhibiting input",
      "def":
          "A gate input that blocks an output which might otherwise occur in a computer.",
    },
    {
      "id": 1,
      "word": "inhibitor, corrosion",
      "def":
          "A material which prevents or delays oxidation and galvanic action.",
    },
    {
      "id": 1,
      "word": "Initial Permeability (NO)",
      "def":
          "Permeability=u=B/H Initial permeability is that value of permeability when Bac=10gs.",
    },
    {
      "id": 1,
      "word": "Initial Resistance",
      "def":
          "The resistance of a PolySwitch device under specified conditions (e.g., 20?C), before connection into a circuit. Devices of a particular type will be delivered with a range of resistances; therefore, a minimum value, Rmin, and/or a maximum value, Rmax, are often given.",
    },
    {
      "id": 1,
      "word": "initialize",
      "def":
          "A program or hardware circuit which will return a program, a system, or a hardware device to an original state.",
    },
    {
      "id": 1,
      "word": "Input",
      "def":
          "The part of a circuit or device into which a signal is directed or applied. The signal that is applied to a circuit or device.",
    },
    {
      "id": 1,
      "word": "input bias current",
      "def":
          "The dc current that must be present at the amplifier input in order for the amplifier to be functional. It is measured with no signal applied.",
    },
    {
      "id": 1,
      "word": "Input Current",
      "def":
          "Current drawn from the input power bus by a converter when operating under nominal conditions",
    },
    {
      "id": 1,
      "word": "input impedance",
      "def":
          "The impedance that exists between the input terminals of an amplifier or transmission line when the source is disconnected. The circuit, signal level, and frequency must be specified.",
    },
    {
      "id": 1,
      "word": "Input Line Filter",
      "def":
          "A power filter placed on the input to a circuit or assembly that attenuates noise introduced from the power bus. The filter is designed to reject lise within a frequency band. Typically these filters arc low-pass filters meaning they pass low frequency signals such as the DC power and attenuate higher frequency signal which consist of mainly noise. Band pass or low pass filters are commonly made up of inductor and capacitor combinations. (Also see Noise, Attenuation, EMI and Pi-Filter).",
    },
    {
      "id": 1,
      "word": "input offset current",
      "def":
          "The difference in the currents into the two input terminals of an operational amplifier when the output is at zero.",
    },
    {
      "id": 1,
      "word": "input offset voltage",
      "def":
          "The voltage that must be applied between the two input terminals of an operational amplifier to obtain zero output voltage.",
    },
    {
      "id": 1,
      "word": "Input Reflected Ripple Current",
      "def":
          "AC component (typically generated by the switching circuit) measured at the input of a converter. Given as a peak-to-peak or RMS value.",
    },
    {
      "id": 1,
      "word": "Input Surge Current",
      "def":
          "Maximum, instantaneous input current drawn by a converter at turn on. Also called Inrush Current.",
    },
    {
      "id": 1,
      "word": "Input Transient",
      "def":
          "Spike or step change in the input to a converter. Input transient protection circuits arc used to shield sensitive components (such as the semiconductor switch) from possible damage due to transients.",
    },
    {
      "id": 1,
      "word": "Input Voltage Range",
      "def":
          "Minimum and maximum input voltage limits within which a converter operates to specifications. Often given as a ratio of high line to low line (i.e. a range of 9VDC to 18VDC is 2:1)",
    },
    {
      "id": 1,
      "word": "Inrush Current",
      "def":
          "Maximum, instantaneous input current drawn by a converter at turn on. Also called Input Surge Current.",
    },
    {
      "id": 1,
      "word": "Inrush Current Limiting",
      "def":
          "Protection circuit that limits the current a converter draws at turn on.",
    },
    {
      "id": 1,
      "word": "insert",
      "def":
          "In ARINC, 'D' series, 'W' series, and AMPLIMITE connectors, the insert is that part which holds the contacts in their proper arrangement and electrically insulates them from each other. It will accept contacts, or it may be preloaded with contacts or posts. It is NOT functional by itself, and must be inserted into a shell.",
    },
    {
      "id": 1,
      "word": "Insert Arrangement",
      "def":
          "The number, spacing, and arrangement of contacts in a termination assembly.",
    },
    {
      "id": 1,
      "word": "Insert Cavity",
      "def":
          "A defined hole in the connector insert into which the contacts are inserted.",
    },
    {
      "id": 1,
      "word": "insert molding",
      "def":
          "Two-step process wherein material is injection molded to form a part, which is then moved to a new mold as an insert, with another component molded against the first.",
    },
    {
      "id": 1,
      "word": "insertion force",
      "def":
          "The effort, usually measured in ounces, required to engage mating components.",
    },
    {
      "id": 1,
      "word": "insertion loss",
      "def":
          "The loss in load power due to the insertion of a component, connector, or device at some point in a transmission system. Generally expressed as the ratio - in decibels - of the power received at the load before insertion of the apparatus, to the power received at the load after insertion.",
    },
    {
      "id": 1,
      "word": "insertion tool",
      "def":
          "A tool used to insert contacts into a housing, insert, or module, or to insert connectors into panels or pc boards.",
    },
    {
      "id": 1,
      "word": "Inspection Hole",
      "def":
          "A hole placed at one end of a contact barrel to permit visual inspection, to ensure that the conductor has been inserted to the proper depth in the barrel prior to crimping or soldering.",
    },
    {
      "id": 1,
      "word": "Institute of Electrical and Electronic Engineers",
      "def":
          "IEEE - Professional organization that defines network standards. IEEE LAN standards are the predominant LAN standards today, including protocols similar or virtually equivalent to Ethernet and Token Ring.",
    },
    {
      "id": 1,
      "word": "instruction",
      "def":
          "A set of bits which will cause a computer to perform certain prescribed operations. A computer instruction consists of: 1)An operation code which specifies the operation(s) to be performed. 2) One or more operands (or addresses of operands in memory). 3) One or more modifiers (or addresses of modifiers) used to modify the operand or its address. Instruction can also be called an order. The signal that initiates the operation is called a command.",
    },
    {
      "id": 1,
      "word": "Insulated Gate Bipolar Transistor",
      "def":
          "IGBT - Power semiconductor device available for use in power conversion circuits.",
    },
    {
      "id": 1,
      "word": "Insulated Terminal",
      "def":
          "A solderless terminal with an insulated sleeve over the barrel to prevent a short circuit in certain installations.",
    },
    {
      "id": 1,
      "word": "Insulating Layer",
      "def": "A coating or volume of dielectric material.",
    },
    {
      "id": 1,
      "word": "insulation",
      "def":
          "A material having high electric resistance making it suitable for covering components, terminals, and wires, to prevent the possible future contact of adjacent conductors resulting in a short circuit.",
    },
    {
      "id": 1,
      "word": "insulation barrel",
      "def":
          "The portion(s) of a terminal, splice, or contact that is crimped. When designed to receive the conductor, it is called the wire barrel. When designed to support or grip the insulation, it is called the insulation barrel. Wire and/or insulation barrels may be either 'open' or 'closed' in design. Closed barrels resemble a hollow cylinder into which the wire must be inserted. Open barrels are formed into an open 'U' and are common to most strip terminals manufactured by AMP Incorporated.",
    },
    {
      "id": 1,
      "word": "insulation crimp",
      "def":
          "The area of a terminal, splice, or contact that has been formed around the insulation of the wire.",
    },
    {
      "id": 1,
      "word": "insulation displacement",
      "def":
          "A terminating technique whereby an insulated wire is forced into a restrictive slot in a terminal, during which time the wire insulation is displaced, and the bare wire engages the sides of the slot.",
    },
    {
      "id": 1,
      "word": "insulation grip",
      "def":
          "Certain crimp contacts have extended cylinders at the rear designed to accept the bared wire and a small length of its insulation. When crimped, both the wire and insulation are held firmly in place. This prevents the wire from being exposed due to insulation receding from the terminal.",
    },
    {
      "id": 1,
      "word": "insulation piercing",
      "def":
          "A method of crimping whereby lances cut through the insulation of the wire and enter into the strands and make electrical contact thus eliminating stripping of the wire.",
    },
    {
      "id": 1,
      "word": "Insulation Resistance",
      "def":
          "Minimum electrical resistance permitted between any pair of contacts and between conductors and grounding devices of the same connectors in various combinations. An indication of the insulating properties of a material.",
    },
    {
      "id": 1,
      "word": "insulation support",
      "def":
          "An extended barrel or additional barrel at the rear of a terminal or contact which is crimped around the wire insulation to give additional support against wire flexing and reduce the possibility of wire breakage immediately behind the wire barrel. This crimp is not considered 'grip' and offers little protection against longitudinal tension when exerted on the wire insulation.",
    },
    {
      "id": 1,
      "word": "Insulation, Electrical",
      "def":
          "A nonconductive material usually surrounding or separating two conductive materials. Often called the dielectric in cables designed for highfrequency use.",
    },
    {
      "id": 1,
      "word": "Insulation, Thermal",
      "def": "A nonconductive material that prevents the passage of heat.",
    },
    {
      "id": 1,
      "word": "integrated circuit",
      "def":
          "An interconnected array of active and passive elements integrated with a single semiconductor substrate or deposited on the substrate by a continuous series of compatible processes, and capable of performing at least one complete electronic circuit function. Normally, only the input, output, and supply terminations are accessible. Also called monolithic circuit and monolithic integrated circuit. When transistors or other discrete components are separately mounted and connected, it is a hybrid integrated circuit.",
    },
    {
      "id": 1,
      "word": "integrated circuitry",
      "def":
          "A fabricated part which serves all or a portion of a function and which is constructed by etching, diffusing, doping, etc of a single piece of material. Sections of this material may be joined by the use of jumper wires or printed circuitry.",
    },
    {
      "id": 1,
      "word": "Integrated detector/preamplifier",
      "def":
          "A detector package containing a pin photodiode and transimpedance amplifier.",
    },
    {
      "id": 1,
      "word": "interaction",
      "def":
          "The effects of two or more elements, parts, assemblies, or equipments on each other - where each is performing a function.",
    },
    {
      "id": 1,
      "word": "Intercept Point",
      "def": "The point at which two lines intersect.",
    },
    {
      "id": 1,
      "word": "interchangeable",
      "def":
          "A connector of one manufacturer can be replaced with a connector of another manufacturer, and will provide the same function in the same panel space as the connector it is replacing.",
    },
    {
      "id": 1,
      "word": "Interconnection",
      "def": "The joining of one individual device with another.",
    },
    {
      "id": 1,
      "word": "Interface",
      "def":
          "(1) The point at which two systems or pieces of equipment are connected. (2) A connection between two systems or devices. A shared boundary defined by common physical interconnection characteristics, signal characteristics, and meanings of interchanged signals.",
    },
    {
      "id": 1,
      "word": "interfacial compression",
      "def":
          "The compression of the resilient material (face of mating inserts) that provides positive sealing and insulation when plug and receptacle are locked together.",
    },
    {
      "id": 1,
      "word": "interfacial connection",
      "def":
          "A conductor which connects conductive patterns on opposite sides of a printed circuit board or other base. May be accomplished with a platedthru hole. Also a feed-thru connection.",
    },
    {
      "id": 1,
      "word": "interfacial gap",
      "def": "Any gap between the interface of mated connectors.",
    },
    {
      "id": 1,
      "word": "interfacial junction",
      "def":
          "The junction that is formed by the interface of two mating connectors. This junction can be tightly compressed or loose, depending upon the requirements of the application.",
    },
    {
      "id": 1,
      "word": "interfacial seal",
      "def":
          "Sealing of a multiple contact connector over the whole area of the interface to provide sealing around each contact. This is usually done by providing a soft insert material on one or both of the connectors which are in compression when mated. This provides an environmental seal between the interface of the plug and the interface of the receptacle and also increases the dielectric between contacts.",
    },
    {
      "id": 1,
      "word": "interference protection",
      "def":
          "Those measures which shield or immunize sensitive areas of an equipment from electrical interference.",
    },
    {
      "id": 1,
      "word": "interlaced memory",
      "def":
          "A memory with sequentially addressed locations occupying physically separated positions in the storage media.",
    },
    {
      "id": 1,
      "word": "intermateable",
      "def":
          "When a connector manufactured by one company will mate directly with a connector manufactured by a different company. For example when an AMP 50-position 'M' series block loaded with AMP Type III(+) pin contacts is mated with a 50-position Winchester 'MRA' series block loaded with Winchester sockets.",
    },
    {
      "id": 1,
      "word": "Intermediate Frequency",
      "def":
          "The desired output frequency from the down conversion mixing process, which is normally the difference between the LO and signal frequencies, i.e., (LO-RF) or (RF-LO).",
    },
    {
      "id": 1,
      "word": "Intermodulation Distortion",
      "def":
          "The distortion produced by nonlinear impedance in a component or system when two or more signals with distinct frequencies are present. Intermodulation products occur at the sums and differences of all harmonics of the original signals.",
    },
    {
      "id": 1,
      "word": "Intermodulation Frequencies",
      "def":
          "Frequencies of signals that are generated as a result of the combination of harmonic generation and mixing action of multiple input signals by nonlinear impedances in a system or device. For the case where there are two input signals, the intermodulation frequencies that are produced are given by",
    },
    {
      "id": 1,
      "word": "Internal Diameter",
      "def": "ID - The inside or internal diameter of a tubing.",
    },
    {
      "id": 1,
      "word": "Internal Power Dissipation",
      "def":
          "Power dissipated (as heat) within the converter during normal operation. Primarily a function of the power handling capability and efficiency of the converter. Internal power dissipation is normally given as a maximum specification that cannot be exceeded without risking damage to the converter.",
    },
    {
      "id": 1,
      "word": "International Electrotechnical Commission",
      "def":
          "(IEC) Organization based in Switzerland that sets standards for electronic products and components. IEC does not conduct any testing; however, their standards have been adopted by many of the national safety/standards agencies.",
    },
    {
      "id": 1,
      "word": "Interstice",
      "def":
          "In a cable construction, the space or void left between or around the cabled components.",
    },
    {
      "id": 1,
      "word": "Intranet",
      "def": "A private network that uses Internet software and standards.",
    },
    {
      "id": 1,
      "word": "inverter",
      "def":
          "(1) In logic, a digital circuit which inverts the input signal, as for example, changing a 1 to a 0. This is equivalent logically to the NOT function. An inverter may also serve as a buffer amplifier. (2) Power conversion circuit that converts DC to AC power.",
    },
    {
      "id": 1,
      "word": "Inverter Transformer",
      "def":
          "A transformer driven in such a manner that an applied DC power is converted to AC power (square waveform). Quite often the core is driven into saturation to accomplish this function.",
    },
    {
      "id": 1,
      "word": "Ion Implantation",
      "def":
          "The introduction of free ions into a material by accelerating them, under the influence of a large electromagnetic field, through space into a target material such as a semiconductor wafer. Ion implantation is used in the semiconductor industry to add dopants to wafers at low temperature, rather than to use high temperature diffusion or epitaxial deposition techniques.",
    },
    {
      "id": 1,
      "word": "ionomer",
      "def":
          "A thermoplastic with polyethylene as a major component and containing covalent and ionic bonds.",
    },
    {
      "id": 1,
      "word": "IP",
      "def": "Internet protocol",
    },
    {
      "id": 1,
      "word": "Iron-Core Coil/Transformer",
      "def":
          "Coil/transformer wound around an iron core to increase its inductance. At audio frequencies the iron core consists of laminations of silicon steel insulated from each other by varnish or shellac. At radio frequencies the core consists of powdered iron mixed in a binder which insulates the particles from each other.",
    },
    {
      "id": 1,
      "word": "IRQ",
      "def":
          "Interrupt Request Line, it is used to connect between CPU and peripheral",
    },
    {
      "id": 1,
      "word": "Irradiation",
      "def":
          "In insulations, the exposure of the material to high-energy emissions for the purpose of favorably altering the molecular structure via crosslinking.",
    },
    {
      "id": 1,
      "word": "IS-95",
      "def":
          "A digital mobile telephony air interface standard that uses CDMA transmission.",
    },
    {
      "id": 1,
      "word": "Isc Max",
      "def":
          "The maximum short circuit a PolySwitch device is tested at the maximum operating voltage as specified.",
    },
    {
      "id": 1,
      "word": "ISDN",
      "def":
          "Integrated Services Digital Network- A CCITT networking standard devised to provide end-to-end, simultaneous handling of digitized voice and data traffic on the same link",
    },
    {
      "id": 1,
      "word": "ISO",
      "def": "International Standard Organization.",
    },
    {
      "id": 1,
      "word": "Isolated Output",
      "def": "See Floating Output",
    },
    {
      "id": 1,
      "word": "Isolation",
      "def":
          "Electrical separation between the input and output of a converter; Normally determined by transformer characteristics and component spacing. Referring to isolation is specified in values of resistance (RISO, typically megohms) and capacitance (CISO, typically pF).",
    },
    {
      "id": 1,
      "word": "Isolation Capacitance",
      "def":
          "Electrical separation between the input and output of a converter; Normally determined by transformer characteristics and component spacing. Referring to isolation is specified in values of resistance (RISO, typically megohms) and capacitance (CISO, typically pF).",
    },
    {
      "id": 1,
      "word": "isolation diffusion",
      "def":
          "The first diffusion of a monolithic integrated circuit. Its purpose is to generate the back-to-back junctions which isolate all active devices from one another.",
    },
    {
      "id": 1,
      "word": "Isolation Resistance",
      "def":
          "Electrical separation between the input and output of a converter; Normally determined by transformer characteristics and component spacing. Referring to isolation is specified in values of resistance (RISO, typically megohms) and capacitance (CISO, typically pF).",
    },
    {
      "id": 1,
      "word": "Isolation Transformer",
      "def":
          "Transformer with a one-to-one turns ratio. connected between the a.c. power input to a piece of equipment and the a.c. line, to minimize shock hazard.",
    },
    {
      "id": 1,
      "word": "Isolation Voltage",
      "def":
          "Maximum voltage (AC or DC) that can be continuously applied between isolated circuits without a breakdown occuring. On converters, this is normally specified as input-output or input-case isolation. Minimum isolation voltage levels be maintained to meet most safety regulations. Also see Breakdown Voltage, High Potential and Isolation.",
    },
    {
      "id": 1,
      "word": "Isolator",
      "def":
          "A three port circulator with one of its ports terminated with its characteristic impedance.",
    },
    {
      "id": 1,
      "word": "Isotropic",
      "def":
          "Having magnetic properties that are independent of the magnet orientation. Most magnetic materials are anisotropic as cast or powdered: each crystallite has a preferred direction of magnetic orientation. If the particles are not physically oriented during manufacture of the magnet, this results in random arrangement of the particles and magnetic domains, and produces isotropic magnetic properties. Conversely, orienting the material during the manufacture results in an anisotropic magnet.",
    },
    {
      "id": 1,
      "word": "ISP",
      "def": "Internet Service Provider",
    },
    {
      "id": 1,
      "word": "IT",
      "def":
          "The smallest steady state current that, if passed through a PolySwitch device, will cause the device to trip, under specified conditions.",
    },
    {
      "id": 1,
      "word": "ITAR",
      "def": "International Traffic in ARMS Regulations",
    },
    {
      "id": 1,
      "word": "ITS",
      "def": "Intelligent Transport Systems (eg fm Signav)",
    },
    {
      "id": 1,
      "word": "ITU",
      "def": "International Telecommunications Union",
    },
    {
      "id": 1,
      "word": "I-V Transfer Characteristics",
      "def":
          "The curve that is produced when the current that flows in a device is plotted against the voltage that is impressed across the device. The I-V transfer characteristic of a passive component, such as a resistor, capacitor or inductor is linear. The I-V transfer characteristic of a semiconductor junction is exponential.",
    },
    {
      "id": 1,
      "word": "IXC",
      "def":
          "Interexchange Carrier- (1)A long-distance telephone company offering circuit-switched, leased-line or packet-switched service or some combination. (2) Any individual, partnership, association, joint-stock company, trust, governmental entity or corporation engaged for hire in interstate or foreign communication by wire or radio, between two or more exchanges.",
    },
    {
      "id": 1,
      "word": "jack",
      "def":
          "A connecting device into which a plug can be inserted to make circuit connections.",
    },
    {
      "id": 1,
      "word": "Jacket",
      "def":
          "1.) A material covering over a wire or cable assembly. 2.) Outer covering of a dual-wall heat-shrinkable tubing.",
    },
    {
      "id": 1,
      "word": "jackscrew",
      "def":
          "(connector/accessory) A mechanical fastening device (one or two per connector) used to draw mating connectors together and to separate them. Includes a threaded screw on one connector that engages a threaded bushing on the mating connector.",
    },
    {
      "id": 1,
      "word": "JAN specification",
      "def": "Joint Army-Navy specification.",
    },
    {
      "id": 1,
      "word": "jitter",
      "def":
          "Short-term variation of pulses from their ideal position in time.",
    },
    {
      "id": 1,
      "word": "Jones block",
      "def":
          "Jones is the name of the originator of barrier blocks. The term 'Jones block' is sometimes erroneously used to describe terminal strips and barrier blocks in general.",
    },
    {
      "id": 1,
      "word": "Joule",
      "def":
          "A unit of energy or work, equal to one watt of power applied for one second. In more fundamental units, a joule is defined as the work required to move an object one meter while applying a force of one newton (N), where a newton is the force required to accelerate a one kilogram mass at one meter per square second.",
    },
    {
      "id": 1,
      "word": "jumper",
      "def":
          "(1) A direct electrical connection, which is not a portion of the conductive pattern, between two points on a printed circuit. (2) Usually unjacketed twisted pair wire used to make a cross connection.",
    },
    {
      "id": 1,
      "word": "Junction",
      "def":
          "The plane in a semiconductor device where two layers that have opposing-polarity dopants physically meet.",
    },
    {
      "id": 1,
      "word": "Kapton",
      "def":
          "A trademark of E. I. duPont for a plastic of the 'imide family' that is capable of withstanding 400?C for extended time. Used as a flexible substrate (such as a miniature pc board) to interconnect silicon chips.",
    },
    {
      "id": 1,
      "word": "Kbps",
      "def": "A data rate. Kilobits, or thousands of bits, per second.",
    },
    {
      "id": 1,
      "word": "kcmil",
      "def":
          "Thousand circular mils. The power industry uses this symbol in preference to MCM.",
    },
    {
      "id": 1,
      "word": "Kelvin Scale",
      "def":
          "The temperature scale whose origin is the temperature at which all molecular motion would cease. The unit is the degree Kelvin (oK), which has the same magnitude as a degree celsius (oC).",
    },
    {
      "id": 1,
      "word": "key",
      "def":
          "A projection which engages with a keyway to guide a component during mating.",
    },
    {
      "id": 1,
      "word": "keying",
      "def":
          "A mechanical arrangement of guide pins, guide sockets, keying plugs, contacts, bosses, slots, keyways, inserts, or grooves in a housing, shell, or insert that allows connectors of the same size and type to be lined up side by side with no danger of making a wrong connection. Keying may also be accomplished by numbering the connectors and matching panel positions, or by using connectors of a different size or color. Under certain circumstances, keying and polarization may be combined in a connector design.",
    },
    {
      "id": 1,
      "word": "keying plug",
      "def":
          "A component used to provide additional polarization for mating connectors. Two types of keying plugs are Intercontact and On-Contact. Intercontact:These keying plugs are designed to fit into slots between the contact cavities. A slot must be cut in the mating pc board for proper engagement.; On-contact. These keying plugs are designed to fit into an empty contact cavity. A slot must be cut in the pc board, or the mating contact must be removed from the mating connector for proper engagement.",
    },
    {
      "id": 1,
      "word": "keyway",
      "def": "A slot or groove in which a key engages.",
    },
    {
      "id": 1,
      "word": "kilo",
      "def": "Metric prefix meaning 1,000.",
    },
    {
      "id": 1,
      "word": "Kilobits per second (kbps)",
      "def": "1,000 bits per second. A measure of transmission speed.",
    },
    {
      "id": 1,
      "word": "Kilovolt",
      "def": "kV - a unit equal to 1000 volts.",
    },
    {
      "id": 1,
      "word": "KMER",
      "def":
          "Kodak metal etch resist. A photosensitive material used to mask silicon and silicon dioxide for selective etching. Performs the same function as KPR.",
    },
    {
      "id": 1,
      "word": "Knee (of the demagnetization curve)",
      "def":
          "In the second and fourth quadrants of the hysteresis loop, some materials such as ferrite and rare earth exhibit a distinct 'knee', or rapid change in slope of the intrinsic curve. The location of the knee is of interest to designers.",
    },
    {
      "id": 1,
      "word": "Kool Mu",
      "def":
          "Kool Mu (r) is a magnetic material that has an inherent distributed air gap. The distributed air gap allowes the core to store higher levels of magnetic~ when compared to other magnetic materials such as ferrites. This characteristic allows a higher DC current level to flow through the inductor before the inductor saturates. Kool Mu (r) material is an alloy that is made up of basically nickel and iron powder (approx. 50% of each) and is available in several permeabilities. It has a higher permeability than powdered iron and also lower core losses. Kool Mu (r) is require to be pressed at much higher pressure than powdered iron material. The manufacturing process includes an annealing step that relieves the pressure put onto the powdered metals which restores their desirable magnetic properties. Thus, the powdered particles require a high temperature insulation as compared to powdered iron. Kool Mu (r) performs well in switching power applications. The relative cost is significantly higher than powdered iron.",
    },
    {
      "id": 1,
      "word": "Kovar",
      "def":
          "A trademark of Westinghouse Electric Corporation for an iron-nickel-cobalt alloy which has a coefficient of expansion similar to glass and silicon. Used as a header material and in glass-to-metal seals. Has thermal characteristics similar to alumina.",
    },
    {
      "id": 1,
      "word": "KPR",
      "def": "Kodak photo resist. See also KMER.",
    },
    {
      "id": 1,
      "word": "Ku-Band",
      "def": "The frequency interval from 12.4 to 18 GHz.",
    },
    {
      "id": 1,
      "word": "Kulka block",
      "def":
          "Kulka is a manufacturer's name (Kulka Electric Corp), but the term is frequently used in error as a generic term to describe terminal blocks in general.",
    },
    {
      "id": 1,
      "word": "kV",
      "def": "Kilovolt - A unit equal to 1000 volts.",
    },
    {
      "id": 1,
      "word": "Kynar",
      "def":
          "Trade name (of Elf Atochem North America) for polyvinylidene fluoride and its copolymers.",
    },
    {
      "id": 1,
      "word": "L1",
      "def":
          "L1 Frequency - 1575.42 MHz. - one of the two radio frequencies transmitted by the GPS satellites. This frequency carries the Coarse Acquisition Code (C/A code), P-Code, and the nav message.",
    },
    {
      "id": 1,
      "word": "L2",
      "def":
          "L2 Frequency - 1227.6 MHz - one of the two radio frequencies transmitted by the GPS satellites. This frequency carries only the P-Code.",
    },
    {
      "id": 1,
      "word": "L3",
      "def": "Level 3 frequency",
    },
    {
      "id": 1,
      "word": "L5",
      "def":
          "Level 5 frequency - 1176.45 MHz - additional frequency used on new ?Block IIF' satellites, intended for civilian applications in air traffic control.",
    },
    {
      "id": 1,
      "word": "LAAS",
      "def": "Local Area Augmentation System",
    },
    {
      "id": 1,
      "word": "label",
      "def":
          "An ordered set of characters used to symbolically identify an instruction, a program, a quantity, or a data area. The label also symbolically designates the memory location which is to contain the instruction, etc. The label is, therefore, the symbolic analog of an address. A label may be absolute, relative, direct, or indirect. See also address.",
    },
    {
      "id": 1,
      "word": "Lacing Cord or Twine",
      "def":
          "Used for lacing and tying cable forms, hookup wires, cable ends, cable bundles, and wire harness assemblies. Available in various materials and impregnants.",
    },
    {
      "id": 1,
      "word": "Lambda",
      "def":
          "The physical distance between two points of identical phase on consecutive cycles of a wave. The symbol for wavelength is lambda, 'l'. Wavelength is related to frequency according to the equation l=c/f, where c is the speed of light (3*108 m/s) f is frequency in Hz.",
    },
    {
      "id": 1,
      "word": "Laminated Cores",
      "def":
          "Cores constructed by stacking multiple laminations on top of each other. The laminations are offered in a variety of materials and thicknesses. Some laminations are made to have the grains oriented to minimize the core losses and give higher permeabilities. Each lamination has an insulated surface which is commonly an oxide finish. Laminated cores are used in some inductor designs but are more common in a wide variety of transformer applications.",
    },
    {
      "id": 1,
      "word": "laminating",
      "def":
          "The process of bonding two or more layers of material together, using heat, pressure, and an adhesive.",
    },
    {
      "id": 1,
      "word": "Laminations",
      "def":
          "Supplied in stamped letter shapes such as 'EI', 'EL', 'EE', 'F', or 'UI', they are composed of silicon iron and nickel alloys. Audio and telecommunication transformers use nickel alloys, while silicon iron is generally used for line frequency power transformers.",
    },
    {
      "id": 1,
      "word": "LAN",
      "def":
          "Local Area Network - The means by which a local community of users and workgroups can share information and resources electronically. Many communications protocols are used to accomplish this, the most prevalent of which are Ethernet and Token Ring. Usually confined to one building or even one floor. Large companies may have several LANs connected by an internetwork or backbone network.",
    },
    {
      "id": 1,
      "word": "land",
      "def":
          "The printed conductive portion of a printed circuit board. See also pad and terminal area.",
    },
    {
      "id": 1,
      "word": "Lanyard",
      "def":
          "A device, attached to certain quick-disconnect connectors, that permits uncoupling and separation of connector halves by a pull on a wire or cable.",
    },
    {
      "id": 1,
      "word": "large-scale computer",
      "def":
          "A computer that is more sophisticated and faster than a minicomputer; capable of addressing megabytes of memory and of operating several peripherals. A computer suitable for most general-purpose, scientific, and data-processing applications.",
    },
    {
      "id": 1,
      "word": "large-scale integration",
      "def":
          "LSI - A term describing the level of complexity or size of an integrated circuit. An LSI circuit is considered to have in excess of 100 digital gates, or equivalent circuitry.",
    },
    {
      "id": 1,
      "word": "Laser",
      "def":
          "Light amplification by stimulated emission and radiation. A device that generates or amplifies light by means of a medium that provides optical gain. Common types of lasers include solid state (glass or cystalline bulk material), semiconductor (based on p-n junctions), and gas lasers. Fiber lasers are doped glass lasers designed to amplify the light in optical fibers.",
    },
    {
      "id": 1,
      "word": "laser diode",
      "def":
          "A semiconductor device that converts an electrical input into a coherent light output.",
    },
    {
      "id": 1,
      "word": "Last mile",
      "def":
          "A reference to the local loop, the distance between a local telco office and the subscriber, a distance actually about 0 to 3 miles (0 to 4 kilometers).",
    },
    {
      "id": 1,
      "word": "Lateral displacement loss",
      "def":
          "The loss of power that results from lateral displacement from optimum alignment between two fibers or between a fiber and an active device.",
    },
    {
      "id": 1,
      "word": "Lay",
      "def":
          "Refers to direction or sometimes the ratio of lay length to core diameter.",
    },
    {
      "id": 1,
      "word": "Lay Length",
      "def":
          "A term used in cable manufacturing to denote the distance of advance of one member, or a group of spirally twisted members in one turn, measured axially. The lay of any helical element of a cable or conductor is the axial length of a turn of the helix of that element.",
    },
    {
      "id": 1,
      "word": "layout",
      "def":
          "The topological arrangement of conductors and components in integrated circuit design. A precursor to artwork.",
    },
    {
      "id": 1,
      "word": "L-Band",
      "def": "The frequency interval from 1 to 2 GHz.",
    },
    {
      "id": 1,
      "word": "LCD",
      "def":
          "Liquid crystal display. A seven-segment (typically) display device consisting of a liquid crystal hermetically sealed between two glass plates. The readout is either dark characters on a dull white background or white on a dull black background.",
    },
    {
      "id": 1,
      "word": "lead frame",
      "def":
          "A metal frame that includes the leads of a plastic encapsulated DIP. The frame holds the leads in place prior to encapsulation and is cut away after encapsulation.",
    },
    {
      "id": 1,
      "word": "lead(s)",
      "def":
          "Generally one or two wires cut to certain length with or without terminals.",
    },
    {
      "id": 1,
      "word": "leading edge",
      "def":
          "Refers to a pulse. The leading edge of a pulse is defined as that edge or transition which occurs first. The leading edge is usually the transition from a logic 0 to a logic 1.",
    },
    {
      "id": 1,
      "word": "Leakage Current",
      "def":
          "Current flowing from input to output or input to case of an isolated converter at a specified voltage level.",
    },
    {
      "id": 1,
      "word": "Leakage Inductance",
      "def":
          "The inductance that does not link the primary in a coil. It is due to the leakage flux.",
    },
    {
      "id": 1,
      "word": "Leased Line",
      "def":
          "A transmission line reserved by a communication carrier for the private use of a customer.",
    },
    {
      "id": 1,
      "word": "LEC",
      "def": "local exchange carrier",
    },
    {
      "id": 1,
      "word": "LED",
      "def":
          "Light-emitting diode - A semiconductor diode, generally made from gallium arsenide, that can serve as an infrared or visible light source when voltage is applied continuously or in pulses.",
    },
    {
      "id": 1,
      "word": "LEO",
      "def": "Low Earth Orbiting (satellites) (See also GEO and MEO)",
    },
    {
      "id": 1,
      "word": "Levels of packaging",
      "def":
          "A framework of six categories or levels used to define electrical interconnections by function. Level 1:A level of electrical interconnection that includes all those connections that link an active element to the terminals (leads) of the device. For example, the bond wire linking a semiconductor chip to its lead frame.; Level 2: All those connections linking a circuit board with the components mounted thereon. For example, the connection between the legs of a DIP switch and the circuit board.; Level 3: All those connections linking two or more circuit boards together. For example, the connection between motherboard and daughterboard.; Level 4 :All those connections linking two or more functional subassemblies with the system enclosure. For example, the connection between a power supply and circuit board.; Level 5: All those connections that provide the input/output function of the system. For example, the connection between a circuit board and the connector that provides access to the internal workings of the machine.; Level 6: All those connections linking two or more systems. For example, the interconnection between terminals in a local area network.",
    },
    {
      "id": 1,
      "word": "LFM",
      "def":
          "Linear feet per minute, which is a measure of air velocity used to cool a power converter.",
    },
    {
      "id": 1,
      "word": "Life Cycle",
      "def":
          "A test to determine the length of time before failure in a controlled, usually accelerated environment.",
    },
    {
      "id": 1,
      "word": "Life test",
      "def":
          "Reliability test in which a converter is operated (typically under accelerated conditions) over some period of time in order to approximate its life expectancy.",
    },
    {
      "id": 1,
      "word": "Lifeline POTS",
      "def":
          "A minimal telephone service designed to extend a 'lifeline' to the telephone system in case of emergency, particularly when electric power is lost.",
    },
    {
      "id": 1,
      "word": "light-emitting diode",
      "def":
          "LED - A semiconductor diode, generally made from gallium arsenide, that can serve as an infrared or visible light source when voltage is applied continuously or in pulses.",
    },
    {
      "id": 1,
      "word": "Limiter",
      "def":
          "A receiver protector that allows low power signals to propagate from the antenna of a receiver to the next sensitive stage, such as a mixer or LNA, but rejects high power signals that may be incident on the antenna. Limiters are typically self-actuating but may also be controlled by an external bias signal.",
    },
    {
      "id": 1,
      "word": "Line",
      "def":
          "Bus used to deliver power to the input terminals of a converter. Also see Bus, High Line and Low Line.",
    },
    {
      "id": 1,
      "word": "Line Code",
      "def":
          "Any method of converting digital information to analog form for transmission on a telephone line. 2B1Q, DMT, and CAP are all line codes.",
    },
    {
      "id": 1,
      "word": "line cord",
      "def":
          "Standard - A two-wire cord terminating in a two-prong plug at one end.; Grounded - A two-wire-with-ground cord terminating in a three-prong plug.; Both types of line cord are used to connect electrical/electronic equipment or appliances to a power outlet.",
    },
    {
      "id": 1,
      "word": "Line Effect",
      "def": "Line Regulation.",
    },
    {
      "id": 1,
      "word": "line impedance",
      "def":
          "Impedance as measured across the terminals of a transmission line. Frequently, the characteristic impedance of the line.",
    },
    {
      "id": 1,
      "word": "line printer",
      "def":
          "A printing device that can simultaneously print several character graphics on hard copy. A line typically consists of 120 characters.",
    },
    {
      "id": 1,
      "word": "Line Regulation",
      "def":
          "Power supply regulation technique in which the regulating device (typically a transistor) is placed in series or parallel with the load. Voltage variations across the load are controlled by changing the effective resistance of the regulating device to dissipate unused power. Also see Series Regulator, Shunt Regulator and Post Regulation.",
    },
    {
      "id": 1,
      "word": "Line transient",
      "def":
          "Spike or step change in the input to a converter. Input transient protection circuits arc used to shield sensitive components (such as the semiconductor switch) from possible damage due to transients.",
    },
    {
      "id": 1,
      "word": "Linear",
      "def":
          "A circuit or component whose transfer function can be accurately described by a first order equation (a straight line, hence the term linear).",
    },
    {
      "id": 1,
      "word": "linear circuit",
      "def":
          "A circuit whose output is either an amplified version of its input, or a predetermined variation of its input.",
    },
    {
      "id": 1,
      "word": "Linear Material",
      "def":
          "Magnetic material that exhibits fairly constant permeability over a wide range of MMF.",
    },
    {
      "id": 1,
      "word": "linear polymer",
      "def":
          "A polymer whose molecules form long chains without cross-linked or branch structures. Usually thermoplastic.",
    },
    {
      "id": 1,
      "word": "Linear Power Transformer",
      "def":
          "Transformers that generally operate between 47Hz and 400Hz in power conversion, which alter the input voltage needed for the load. Linear power transformers are very inefficient.",
    },
    {
      "id": 1,
      "word": "Linear regulation",
      "def":
          "Power supply regulation technique in which the regulating device (typically a transistor) is placed in series or parallel with the load. Voltage variations across the load are controlled by changing the effective resistance of the regulating device to dissipate unused power. Also see Series Regulator, Shunt Regulator and Post Regulation.",
    },
    {
      "id": 1,
      "word": "Linearity",
      "def":
          "For an attenuator, the variation from the best straight line of the attenuation versus control signal transfer function at center frequency, measured in dB or percentage of attenuation. For a VCO, the variation best straight line of the output frequency versus control signal transfer function, measured in per cent. For a system or component: the extent to which the output spectrum is identical to the input spectrum. A system that generates spurious signal is considered to be nonlinear.",
    },
    {
      "id": 1,
      "word": "Liner",
      "def": "See Core.",
    },
    {
      "id": 1,
      "word": "link",
      "def":
          "(1) Physical connection between two nodes in a network. It can consist of a data communication circuit or a direct channel connection. Also an LED signal that indicates connection has been established. (2) A complete network to send and receive data via fiber optics, including transmitter, receiver, fiber, and connectors. (3) The part of the horizontal cabling system between the work area outlet and the telecom closet termination.",
    },
    {
      "id": 1,
      "word": "Litz Wire",
      "def":
          "From the German word 'litzendraght', meaning to consist of a number of separate strands that are woven or bunched together such that each strand tends to take all possible positions in the cross section of the wire as a whole. The current through each individually insulated strand is divided equally since this wire design equalizes the flux linkages and reactance of the individual strands. In other words, a litz conductor has lower AC losses than compared to solid wire conductors, which becomes important as operation frequency increases.",
    },
    {
      "id": 1,
      "word": "LMDS",
      "def":
          "Local Multipoint Distribution Service - Any service providing high-speed transmission of voice and data from single distribution points to multiple users. Generally, LMDS provides wireless broadband communications to small and medium-sized companies or to apartment buildings.",
    },
    {
      "id": 1,
      "word": "LNA",
      "def": "Low noise amplifier",
    },
    {
      "id": 1,
      "word": "LO",
      "def": "Local Oscillator",
    },
    {
      "id": 1,
      "word": "Load",
      "def":
          "A device or impedance that terminates the output of a device or transmission line. A load is typically a resistance, the magnitude of which is equal to the characteristic impedance of the transmission line.",
    },
    {
      "id": 1,
      "word": "Load Decoupling",
      "def":
          "Placement of filter components (typically mF capacitors) at the power terminals of the load in order to reduce noise.",
    },
    {
      "id": 1,
      "word": "Load Life",
      "def":
          "The minimum number of cycles the relay will make, carry, and break the specified load without contact sticking or welding, and without exceeding the electrical specifications of the device. Load life is established using various methods including Weibull probability methods.",
    },
    {
      "id": 1,
      "word": "Load Life, Rated Resistive",
      "def":
          "The voltage and current encountered by the contacts when opening and/or closing. To be considered a resistive load, the inductance in the test circuit shall not exceed an L/R ratio of 1 x 10 -4 . Load ratings are established using various methods including Weibull analysis.",
    },
    {
      "id": 1,
      "word": "Load Loss",
      "def":
          "These losses are caused by the resistance of the windings under loaded conditions.",
    },
    {
      "id": 1,
      "word": "Load Regulation",
      "def":
          "Percentage change in output voltage caused by varying the output load over a specified range (with input line, temperature, etc. remaining constant).",
    },
    {
      "id": 1,
      "word": "local area network",
      "def":
          "A privately owned, geographically limited network interconnecting electronic equipment, as in an office building to promote distributed processing and local communications.",
    },
    {
      "id": 1,
      "word": "Local Area Transport Area",
      "def":
          "LATA - (1) A geographic area established for the provision and administration of communications service. It encompasses one or more designated exchanges, which are grouped to serve common social, economic and other purposes. (2) Contiguous local exchange areas that include every point served by a LEC within an existing community of interest and that serve as the dividing line for the allocation of assets and liabilities betweenthe IXC and the LEC. (3) A telephone company term that defines a geographic area', sometimes corresponds to an area code.",
    },
    {
      "id": 1,
      "word": "Local Loop",
      "def":
          "Refers to the physical copper pair or loop of wire from Central Office to the subscriber.",
    },
    {
      "id": 1,
      "word": "Local Oscillator",
      "def":
          "A reference signal generating circuit that is contained within a receiver or transmitter. The LO signal provides the high frequency bias to a mixer. The local oscillator signal is typically at a higher power than the signal power. An optimum local oscillator power is required to obtain low conversion loss and good RF match to the mixer non-linear impedance component. Normally optimum local oscillator powers are in the range of -3 to +13 dBm for most common diodes or FET's.",
    },
    {
      "id": 1,
      "word": "Local sensing",
      "def":
          "Using the output terminals of the converter to provide feedback to voltage regulation circuits. Also see Remote Sensing.",
    },
    {
      "id": 1,
      "word": "locator",
      "def":
          "The device included in the design of most AMP hand crimping tools to position a terminal and assure the proper insertion depth of the stripped wire prior to crimping.",
    },
    {
      "id": 1,
      "word": "logic",
      "def":
          "The basic principles and applications of truth tables, interconnections of on-off elements, and other factors involved in digital electronics. Most AMP electronic controls use two-state gates and IC's to perform decision making functions.",
    },
    {
      "id": 1,
      "word": "logic gate",
      "def":
          "A digital circuit with one or more inputs, and an output which depends logically on the input signal combinations. See also gate and IGFET.",
    },
    {
      "id": 1,
      "word": "Logic Inhibit/Enable",
      "def":
          "Signal (typically TTL/CMOS compatible) used to turn a power supply output on/off. Also called Remote On/Off.",
    },
    {
      "id": 1,
      "word": "Long Term Stability",
      "def":
          "Change in output voltage of a converter over time with all other factors (line, load, temp. etc.) remaining constant. Expressed as a percent, the output change is primarily due to component aging.",
    },
    {
      "id": 1,
      "word": "Longitudinal Change",
      "def":
          "The change in length of tubing when recovered. Expressed in the percent of change from the original length.",
    },
    {
      "id": 1,
      "word": "loom",
      "def":
          "Flexible tubing or sheath, usually nonmetallic, for protecting electrical wires. A cotton-braided sheath is commonly used.",
    },
    {
      "id": 1,
      "word": "loose piece",
      "def":
          "A contact (or terminal) that is produced, packaged, and terminated individually for hand application tooling.",
    },
    {
      "id": 1,
      "word": "LORAN",
      "def": "Long Range Navigation",
    },
    {
      "id": 1,
      "word": "Loss",
      "def": "Reduction in signal power.",
    },
    {
      "id": 1,
      "word": "Loss Factor",
      "def":
          "The product of the power factor and dielectric constant of an insulating material.",
    },
    {
      "id": 1,
      "word": "lossy",
      "def":
          "The property of being a poor conductor that absorbs and dissipates energy.",
    },
    {
      "id": 1,
      "word": "Lot Number",
      "def":
          "The number that identifies one production run of material. Also known as a batch number.",
    },
    {
      "id": 1,
      "word": "Low Line",
      "def":
          "Minimum value of input line voltage speified for normal converter operation.",
    },
    {
      "id": 1,
      "word": "Low Noise Amplifier",
      "def":
          "An amplifier with low noise figure that is typically used at the front end of a radio receiver.",
    },
    {
      "id": 1,
      "word": "Low Pass Filter",
      "def":
          "A reactive circuit that rejects signals whose frequencies are above the 3 dB point frequency and propagates signals whose frequencies are below the 3 dB point frequency.",
    },
    {
      "id": 1,
      "word": "low-density polyethylenes",
      "def":
          "Those polyethylenes whose density ranges from about 0.915 to 0.925. Relatively soft but tough materials.",
    },
    {
      "id": 1,
      "word": "low-level logic",
      "def":
          "Also LO logic. In digital logic, the more negative of the two logic levels in a binary system. In positive logic, a low-logic level is used to represent a logic 0, or a not-true, condition. See also high-level logic, negative logic, and positive logic.",
    },
    {
      "id": 1,
      "word": "Low-loss Dielectric",
      "def":
          "An insulating material that has a relatively low dielectric loss, such as olyethylene or Teflon.",
    },
    {
      "id": 1,
      "word": "LPF",
      "def": "low pass filter",
    },
    {
      "id": 1,
      "word": "LSI",
      "def": "large-scale integration.",
    },
    {
      "id": 1,
      "word": "Lug",
      "def":
          "A termination, usually crimped or soldered to a conductor, that allows connection to be made with a retaining screw.",
    },
    {
      "id": 1,
      "word": "lumped-element filter",
      "def":
          "A filter whose filtering elements, such as ferrite beads, consist of discrete capacitance and inductance, rather than being uniformly distributed throughout. See also distributed-element filter.",
    },
    {
      "id": 1,
      "word": "MAC",
      "def":
          "Moves Adds and Changes - When data and voice services (to include: outlets and cabling, patching, etc.) of a given location are moved to a new location or removed completely.",
    },
    {
      "id": 1,
      "word": "machine language",
      "def":
          "Assigned and defined patterns of bits which convey instructions or data to a computer. The first level of computer language.",
    },
    {
      "id": 1,
      "word": "macroinstruction",
      "def":
          "A short source-language statement, intelligible to a computer, that produces a variable number of instructions in machine language. Used to simplify and speed up the work of programmers.",
    },
    {
      "id": 1,
      "word": "Mag-Mate",
      "def":
          "A family of AMP products used to terminate magnet wire by using the insulation displacement technique. The method is unique in that cavities are provided by the customer in his products to receive the wire and terminal, and the system can be fully automated.",
    },
    {
      "id": 1,
      "word": "Magnet Wire",
      "def":
          "Copper or aluminum wire with electrical insulating material applied to the surface to prevent continuity between adjacent turns in a winding.",
    },
    {
      "id": 1,
      "word": "Magnetic Energy",
      "def":
          "The product of the flux density (B) and the (de)magnetizing force (H) in a magnetic circuit required to reach that flux density.",
    },
    {
      "id": 1,
      "word": "Magnetic Lines Of Force",
      "def":
          "An imaginary line representing a magnetic field, which at every point has the direction of the magnetic flux at that point.",
    },
    {
      "id": 1,
      "word": "Magnetic Path",
      "def": "The route the magnetic flux 'flows' in a magnetic circuit.",
    },
    {
      "id": 1,
      "word": "Magnetic Path Length",
      "def":
          "The length of the closed path that magnetic flux follows around a magnetic circuit. Ampere's Law determines it.",
    },
    {
      "id": 1,
      "word": "main frame",
      "def": "See central processing unit.",
    },
    {
      "id": 1,
      "word": "Majority Carrier",
      "def":
          "The type of charge carrier (electron or whole) that constitutes most of the charge carriers in a semiconductor material. The majority carrier in n-type material is the electron (negative charge) and for p-type material is the hole (positive charge).",
    },
    {
      "id": 1,
      "word": "Manufacturing Order",
      "def":
          "MO -A series of operation-workorder cards identifying materials to be used and the type and quantity of products to be manufactured. An MO is controlled and issued by Production Control to the manufacturing operation.",
    },
    {
      "id": 1,
      "word": "Marking",
      "def":
          "A printed identification number or symbol applied to the surface of a wire or cable.",
    },
    {
      "id": 1,
      "word": "mask",
      "def":
          "A patterned medium placed between a substrate and a process source in order to confine the effects of the process to selected portions of the substrate.",
    },
    {
      "id": 1,
      "word": "mass termination",
      "def":
          "A means of terminating multiple conductors to an identical number of contacts through one complete cycle of applicator tooling. The contacts are an insulation displacement type and the conductors may be discrete wires, round conductor ribbon cable, or flat cable. Special application tooling is required.",
    },
    {
      "id": 1,
      "word": "master pattern",
      "def":
          "A 1:1 scale pattern used to produce the printed circuit within the accuracy specified on the master drawing.",
    },
    {
      "id": 1,
      "word": "Master/Slave Operation",
      "def":
          "Wire used to create a magnetic field such as those in magnetic components (inductors and transformers). Magnet wire is nearly 100% copper and must be made from virgin copper. It is covered with a number of difference organic polymer film coatings.",
    },
    {
      "id": 1,
      "word": "matched impedance",
      "def":
          "The coupling of two circuits in such a way that the impedance of one circuit equals the impedance of the other.",
    },
    {
      "id": 1,
      "word": "mate",
      "def": "To join two connectors in a normal engaging mode.",
    },
    {
      "id": 1,
      "word": "Material dispersion",
      "def":
          "Dispersion resulting from the different velocities of each wavelength in an optical fiber.",
    },
    {
      "id": 1,
      "word": "Material Modification Code",
      "def":
          "MOD Code - A code designating a particular stage in the production process. Most MOD codes describe the way the product is packaged.",
    },
    {
      "id": 1,
      "word": "mating face",
      "def": "interface",
    },
    {
      "id": 1,
      "word": "matrix",
      "def": "grid",
    },
    {
      "id": 1,
      "word": "Maximum Ambient Operating Temperature",
      "def":
          "The highest ambient temperature at which a circuit is expected to operate.",
    },
    {
      "id": 1,
      "word": "Maximum Ambient Operating Temperature",
      "def":
          "The highest ambient temperature at which a circuit is expected to operate.",
    },
    {
      "id": 1,
      "word": "Maximum Device Voltage",
      "def":
          "The highest voltage that can safely be dropped across a PolySwitch device in its tripped state under specified fault conditions.",
    },
    {
      "id": 1,
      "word": "Maximum Fault Current",
      "def":
          "The rated maximum value of peak pulse current of specified amplitude and wave shape that may be applied without damage.",
    },
    {
      "id": 1,
      "word": "Maximum Interrupt Current",
      "def":
          "The highest fault current that can safely be used to trip a PolySwitch device under specified conditions. Typically the lower the voltage dropped across the PolySwitch device in its tripped state, the higher the maximum interrupt current. Maximum interrupt currents are usually shown in this Databook at the maximum voltage. It may be possible to use a PolySwitch device at a higher interrupt current, but each such use must be individually qualified.",
    },
    {
      "id": 1,
      "word": "Maximum Interrupt Voltage",
      "def":
          "The highest voltage that can safely be dropped across a PolySwitch device in its tripped state under specified fault conditions.",
    },
    {
      "id": 1,
      "word": "Maximum Load",
      "def":
          "Highest amount of output load allowable under the continuous operating specifications of a converter.",
    },
    {
      "id": 1,
      "word": "Maximum Operating Voltage",
      "def":
          "The maximum voltage across a PolySwitch device under a typical fault condition. In many circuits, this is the voltage of the power source in the circuit. It may be possible to use a PolySwitch device at a higher voltage, but each such use must be individually qualified.",
    },
    {
      "id": 1,
      "word": "Maximum Output Resistance",
      "def": "The resistance of a device at a specified voltage.",
    },
    {
      "id": 1,
      "word": "Maximum Power Dissipation",
      "def":
          "An inductor's ability to handle the heat generated by operating at maximum current at an ambient temperature, expressed in Watts (W) or milliwatts (mW). This is a function of the body area of the inductor, core material used, and varies for shielded vs. unshielded.",
    },
    {
      "id": 1,
      "word": "Maximum Resistance",
      "def":
          "The maximum resistance of a PolySwitch device at room temperature one hour after being tripped or after reflow soldering.",
    },
    {
      "id": 1,
      "word": "Maximum Resistance",
      "def":
          "The maximum resistance of a PolySwitch device at room temperature one hour after being tripped or after reflow soldering.",
    },
    {
      "id": 1,
      "word": "Maximum Switching Current",
      "def":
          "The maximum current that a device switches at safely without damage.",
    },
    {
      "id": 1,
      "word": "Maximum Voltage",
      "def":
          "The highest voltage that can safely be dropped across a PolySwitch device in its tripped state under specified fault conditions.",
    },
    {
      "id": 1,
      "word": "Maxwell",
      "def":
          "The unit of magnetic flux in the CGS system. One Maxwell = 10-8 webers.",
    },
    {
      "id": 1,
      "word": "Mbps",
      "def": "A data rate. Megabits, or millions of bits, per second.",
    },
    {
      "id": 1,
      "word": "MCM",
      "def":
          "Thousand circular mils. Above 4/0 AWG wire, circular mil areas (CMA) are used rather than AWG wire size. See kcmil.",
    },
    {
      "id": 1,
      "word": "MCNS",
      "def": "multimedia cable network system",
    },
    {
      "id": 1,
      "word": "MDS",
      "def": "microwave distribution system",
    },
    {
      "id": 1,
      "word": "MDU",
      "def": "multi-dwelling unit",
    },
    {
      "id": 1,
      "word": "Mean Time Between Failure",
      "def":
          "MTBF - Unit of measure, expressed in hours, that gives the relative reliability of a converter. MTBF data is based upson actual operating data (demonstrated) or derived per the conditions of MIL-HDBK-217F (calculated).",
    },
    {
      "id": 1,
      "word": "Mean Time to Failure",
      "def":
          "MTTF - The measured operating time of a system or component divided by the number of failures that occurred during that time",
    },
    {
      "id": 1,
      "word": "Mechanical Life",
      "def":
          "This is the number of operations which a relay can be expected to perform while maintaining mechanical integrity. Mechanical life is normally tested with no load or voltage applied to the power contacts and is established using various methods including Weibull analysis.",
    },
    {
      "id": 1,
      "word": "mechanized assembly",
      "def":
          "The joining together of parts and/or subassemblies with the aid of operators and semiautomatic equipment.",
    },
    {
      "id": 1,
      "word": "Media I",
      "def":
          "A 12-row, 80-column card used to program a device. The card measures 3.250 in. by 7.375 in. and the coded program or data is placed on the card in the form of small rectangular punched holes. It is loosely referred to as an IBM card.",
    },
    {
      "id": 1,
      "word": "Media II",
      "def":
          "A 6-row, 90-column card used to program a device. The card measures 3.250 in. by 7.375 in. and the coded program or data is placed on the card in the form of small round punched holes.",
    },
    {
      "id": 1,
      "word": "medium-scale integration",
      "def":
          "MSI - A term describing the level of complexity or size of an integrated circuit. The monolithic integrated circuit has from 10 to 100 gates and falls in size between small-scale integration (SSI) and large-scale integration (LSI).",
    },
    {
      "id": 1,
      "word": "mega",
      "def":
          "A prefix that indicates a factor of one million or 106, abbreviated as 'M.'",
    },
    {
      "id": 1,
      "word": "Megarad",
      "def": "A unit for measuring radiation dosage.",
    },
    {
      "id": 1,
      "word": "melt index",
      "def":
          "Extrusion rate of a thermoplastic material through an orifice of specified diameter and length under specified conditions of time, temperature, and pressure.",
    },
    {
      "id": 1,
      "word": "Melt/Flow Index",
      "def":
          "Measurement of the flow of thermoplastic material under given conditions of temperature and pressure. Expressed as grams per unit of time.",
    },
    {
      "id": 1,
      "word": "Melting Point",
      "def":
          "The temperature at which crystallinity disappears when crystalline material is heated.",
    },
    {
      "id": 1,
      "word": "memory",
      "def":
          "That portion specially designed to receive and store information for use at a later time. Also called storage.",
    },
    {
      "id": 1,
      "word": "MEO",
      "def": "Medium Earth Orbit (satellites) (See also GEO and LEO)",
    },
    {
      "id": 1,
      "word": "message",
      "def":
          "A communication of information or advice from a source to one or more destinations in suitable language or code. In telegraphic and data communications a message is composed of three parts as follows: 1) A heading containing a suitable indicator of the beginning of the specific message together with information on any or all of the following: the source and destination, data and time of filing, and routing or other transmission information. 2) A body containing the information or advice to be communicated. 3) An ending containing a suitable indicator of the conclusion of the specific message, either explicit or implicit.",
    },
    {
      "id": 1,
      "word": "Metal Semiconductor Field Effect Transistor",
      "def":
          "MOSFET - A field effect transistor (FET), often made of gallium arsenide, that uses a metal-on-semiconductor gate. See also 'gallium arsenide field effect transistor' and 'Metal Oxide Semiconductor Field Effect Transistor.'",
    },
    {
      "id": 1,
      "word": "metallization",
      "def":
          "A metal film selectively deposited on a substrate to serve as conductive interconnections between the elements of the integrated circuit, and as points (pads) for external connections.",
    },
    {
      "id": 1,
      "word": "Metal-Oxide-Semiconductor-Field-Effect-Transistor",
      "def":
          "A transistor that consists of electrodes (the source and drain) placed at opposite ends of a silicon channel. On top of the channel and between the electrodes an insulating layer of silicon dioxide is formed, on top of which a metal pad (the gate) is deposited. An electric field is induced into the channel as a result of a potential that is externally applied to across the source and gate. This field modulates the resistance of the channel between the drain and source.",
    },
    {
      "id": 1,
      "word": "metric prefixes",
      "def":
          "A series of prefixes used in the metric system to modify a unit of measure. The most commonly used in electronics are as follows: giga (G) 109; mega (M) 106; kilo (k) 103; centi (c) 10-2; milli (m) 10-3; micro (m) 10-6; nano (n) 10-9; pico (p) 10-12",
    },
    {
      "id": 1,
      "word": "Metropolitan Area Network",
      "def":
          "MAN - A data communication network covering the geographic area of a city. Often used by a CAP to carry backbone traffic in their serving area.",
    },
    {
      "id": 1,
      "word": "mho",
      "def":
          "Unit of conductance. Reciprocal of an ohm. One ampere of current passing through a material under a potential difference of one volt provides one mho of conductance. Also called siemens.",
    },
    {
      "id": 1,
      "word": "MHz",
      "def":
          "Megahertz.Millions of cycles (Hertz) per second. A frequency or frequency range (bandwidth) through which a cabling system is specified.",
    },
    {
      "id": 1,
      "word": "MIC",
      "def":
          "Microwave Integrated Circuit - A circuit that is contained either on a single die or in a single package, intended to operate at microwave frequencies",
    },
    {
      "id": 1,
      "word": "micro",
      "def": "A prefix that indicates a factor 10-6, abbreviated as 'm.'",
    },
    {
      "id": 1,
      "word": "microcomputer",
      "def":
          "A vague term, usually referring to a computer system that uses a microprocessor as the CPU. Also used to mean an integrated circuit having all the parts of a computer: CPU, memory, I/O, etc, although on a less grand scale.",
    },
    {
      "id": 1,
      "word": "microelectronics",
      "def":
          "The art of electronic equipment design and its construction, which utilizes any of the microminiaturization schemes. This art of electronics deals with microminiature parts, subassemblies, and assemblies.",
    },
    {
      "id": 1,
      "word": "microminiature circuitry",
      "def":
          "Circuitry fabricated in accordance with microminiaturization techniques.",
    },
    {
      "id": 1,
      "word": "microminiaturization",
      "def":
          "The technique of packaging a microminiature part or assembly composed of elements radically different in shape and form factor. Electronic parts are replaced by active and passive elements, through use of fabrication processes such as screening, vapor deposition, diffusion, and photoetching.",
    },
    {
      "id": 1,
      "word": "Micron",
      "def": "One-millionth of a meter; A micrometer.",
    },
    {
      "id": 1,
      "word": "microprocessor",
      "def":
          "A single chip or small group of chips that contain all the functions of a computer processor; does not include peripherals.",
    },
    {
      "id": 1,
      "word": "Microstrip",
      "def":
          "An unbalanced transmission line structure that consists of a ground plane on the back side of a printed circuit board, the dielectric material of the printed circuit board and a narrow strip on the top side of the circuit board. The impedance of microstrip is determined by the dielectric constant and the thickness of the dielectric and the width of the strip.",
    },
    {
      "id": 1,
      "word": "Microwatt",
      "def": "One millionth of a watt.",
    },
    {
      "id": 1,
      "word": "Microwave Distribution System",
      "def":
          "A network of microwave radio links used to distribute data or video signals to subscribers.",
    },
    {
      "id": 1,
      "word": "Microwave Integrated Circuit",
      "def":
          "MIC - A circuit that is contained either on a single die or in a single package, intended to operate at microwave frequencies",
    },
    {
      "id": 1,
      "word": "microwaves",
      "def":
          "That portion of the electromagnetic spectrum lying between the far infrared and conventional radio frequency portion. Frequency range extending from 1 GHz to 300 GHz. Microwaves are usually used in point to point communications because they are easily concentrated into a beam.",
    },
    {
      "id": 1,
      "word": "MID",
      "def": "Mode field diameter.",
    },
    {
      "id": 1,
      "word": "migration",
      "def":
          "The movement of some metals from one location to another, notably through pores in a metal surface plating. This can be either the movement of the intermediate plating or the base metal to the surface - which in turn produces insulating films.",
    },
    {
      "id": 1,
      "word": "Mil",
      "def":
          "A unit equal to one onethousandth of an inch (.001'), equivalent to 0.0254 millimeters or 25.4 micrometers; used in measuring the diameter of a conductor or thickness of insulation over a conductor.",
    },
    {
      "id": 1,
      "word": "Military Specification",
      "def":
          "MIL-SPEC - Military requirements; the demand imposed upon the system/device to meet a military operational need.",
    },
    {
      "id": 1,
      "word": "Milking Off",
      "def":
          "Action that occurs when the inner layer (the encapsulant or adhesive) of the tubing or molded part acts as a lubricant, allowing the tubing to slip off the substrate (because the tubing wants to recover to a smaller diameter).",
    },
    {
      "id": 1,
      "word": "milli",
      "def":
          "A prefix meaning 10-3, or one thousandth. One millivolt would be 0.001 volt. Abbreviated as 'm.'",
    },
    {
      "id": 1,
      "word": "millisecond",
      "def": "One thousandth of a second.",
    },
    {
      "id": 1,
      "word": "Milliwatt",
      "def": "One-thousandth of a watt.",
    },
    {
      "id": 1,
      "word": "MIL-SPEC",
      "def":
          "Military Specification - Military requirements; the demand imposed upon the system/device to meet a military operational need.",
    },
    {
      "id": 1,
      "word": "MIM",
      "def":
          "Metal-insulator-metal, a common structure of series capacitors on integrated circuits.",
    },
    {
      "id": 1,
      "word": "miniaturization",
      "def":
          "The technique of packaging by reducing size and weight of electronic parts in step with the change from vacuum tubes to transistors and diodes.",
    },
    {
      "id": 1,
      "word": "minicomputer",
      "def":
          "A computer system midway in price and performance between mainframe and microcomputer.",
    },
    {
      "id": 1,
      "word": "Minimum Discernable Signal",
      "def":
          "The smallest input signal level to a receiver that will produce a discernable output signal.",
    },
    {
      "id": 1,
      "word": "Minimum Full Recovery Temperature",
      "def":
          "The minimum temperature required to fully shrink a product, that is, for the product to recover completely.",
    },
    {
      "id": 1,
      "word": "Minimum Load",
      "def":
          "Minimum amount of output load required on a converter in order to maintain normal continuous operating specifications. Usually associated with PWM (Pulse Width Modulation) controlled converters.",
    },
    {
      "id": 1,
      "word": "Minimum Operating Temperature",
      "def":
          "Minimum ambient temperature at which a converter will start and operate within specifications.",
    },
    {
      "id": 1,
      "word": "Minimum Shrink Temperature",
      "def": "The minimum temperature at which a product begins to recover.",
    },
    {
      "id": 1,
      "word": "Minority Carrier",
      "def":
          "The type of charge carrier (electron or whole) that does not constitutes most of the charge carriers in a semiconductor material. The minority carrier in n-type material is the hole (positive charge) and for p-type material is the electron (negative charge).",
    },
    {
      "id": 1,
      "word": "Misalignment loss",
      "def":
          "The loss of power resulting from angular misalignment, lateral displacement, and end separation.",
    },
    {
      "id": 1,
      "word": "Mismatch",
      "def":
          "The degree to which the impedance of a component differs from the transmission line or component to which it is connected. The degree to which the lattice constant of one crystalline semiconductor differs from the lattice constant of another.",
    },
    {
      "id": 1,
      "word": "Mismatch Loss",
      "def":
          "The power that a device could absorb if its impedance were perfectly matched to that of its surroundings divided by the power that it does absorb.",
    },
    {
      "id": 1,
      "word": "Mixer",
      "def":
          "A three port device that employs at least one component with nonlinear impedance to perform time domain multiplication of signals incident on two of the ports, typically designated RF input and LO input. Among the products of this multiplication at the third port are signals whose frequencies are the sum and the difference of the LO and RF frequencies (see 'up converter' and 'down converter').",
    },
    {
      "id": 1,
      "word": "MLT",
      "def": "The mean-length-turn of wire for a core.",
    },
    {
      "id": 1,
      "word": "MMDS",
      "def":
          "Multipoint microwave distribution system (also known as wireless cable).",
    },
    {
      "id": 1,
      "word": "MMIC",
      "def": "Monolithic Microwave Integrated Circuit",
    },
    {
      "id": 1,
      "word": "mnemonic language",
      "def":
          "A programming language that is based on easily remembered symbols and that can be assembled into machine language by the computer.",
    },
    {
      "id": 1,
      "word": "MO",
      "def":
          "Manufacturing Order - A series of operation-workorder cards identifying materials to be used and the type and quantity of products to be manufactured. An MO is controlled and issued by Production Control to the manufacturing operation.",
    },
    {
      "id": 1,
      "word": "MOD Code",
      "def":
          "Material Modification Code - A code designating a particular stage in the production process. Most MOD codes describe the way the product is packaged.",
    },
    {
      "id": 1,
      "word": "modal dispersion",
      "def":
          "The spreading of a light signal in a fiber as a result of the rays following different paths (or modes) down the fiber. This limits the number of pulses that can be sent per second. In multimode fiber (larger core than single mode) rays take many different zigzag paths along the fiber, requiring more time for some signals to arrive at the other end, which causes a running together of on-off digital pulses.",
    },
    {
      "id": 1,
      "word": "Mode",
      "def":
          "In guided-wave propagation, such as through a waveguide or optical fiber, a distribution of electromagnetic energy that satisfies Maxwell's equations and boundary conditions. Loosely, a possible path followed by light rays.",
    },
    {
      "id": 1,
      "word": "Mode of Failure",
      "def":
          "The manner in which a failure occurs. Reason for which a converter either does not meet or stops meeting its specified parameters.",
    },
    {
      "id": 1,
      "word": "modem",
      "def": "A unit that transmits signals over a telephone line.",
    },
    {
      "id": 1,
      "word": "modifier",
      "def":
          "Additive to a resin compoundwhich changes the compound's properties or processing characteristics.",
    },
    {
      "id": 1,
      "word": "modular",
      "def":
          "(1) A modular connector is one in which similar or identical sections can be assembled together to provide the best connector type or size for the application (2) Being composed of modules dimensioned in accordance with a set of prescribed size increments.",
    },
    {
      "id": 1,
      "word": "Modular jack",
      "def":
          "The standard female connector for twisted pair cable. A 'telephone jack'.",
    },
    {
      "id": 1,
      "word": "Modular plug",
      "def":
          "The standard male connector for twisted pair cable. A 'telephone plug'.",
    },
    {
      "id": 1,
      "word": "modulate",
      "def":
          "To vary the amplitude, frequency, or phase of an oscillation rate - usually at a signal frequency.",
    },
    {
      "id": 1,
      "word": "Modulation",
      "def":
          "The process by which some characteristic of a carrier wave is modified in accordance with an intelligence signal. Commonly used modulation methods include but are not limited to amplitude modulation (AM), frequency modulation (FM), phase modulation (PM), frequency shift keying (FSK) and quadrature amplitude modulation (QAM).",
    },
    {
      "id": 1,
      "word": "Modulation Frequency",
      "def":
          "The frequency or frequency interval of the intelligence signal used to modulate a carrier wave.",
    },
    {
      "id": 1,
      "word": "Modulation Sensitivity",
      "def":
          "For a voltage controlled oscillator that is frequency modulated, the change in VCO frequency divided by the magnitude of the control voltage that produced the change in VCO frequency. Modulation sensitivity is expressed in terms of MHz per volt for RF/microwave VCO's.",
    },
    {
      "id": 1,
      "word": "module",
      "def":
          "(1) A family of inserts which are uniform in external dimension, but may accept different types of contacts, or have different contact densities or configurations. In 'G' series connectors, modules are interchangeable within the shells of that line. See also insert and shell. (2) Encapsulated DC-DC converter",
    },
    {
      "id": 1,
      "word": "modulus",
      "def":
          "Defines the capability of a device in terms of number of distinct states. For example, a modulo-10 counter has a modulus of 10 and, therefore, has 10 distinct states.",
    },
    {
      "id": 1,
      "word": "mold",
      "def":
          "A hollow form which imparts to the material within a final shape as a finished piece. Various types are used in compression molding, injection molding, transfer molding, and other processes.",
    },
    {
      "id": 1,
      "word": "molecular electronics",
      "def":
          "The science of applying solidstate phenomenon in the performance of electronic functions. That branch of electronics which deals with production of complex electronic circuits in microminiature form, by producing semiconductor devices and circuit elements integrally while growing multizoned crystals in a furnace.",
    },
    {
      "id": 1,
      "word": "MOM",
      "def": "message-oriented middleware",
    },
    {
      "id": 1,
      "word": "monolithic integrated circuit",
      "def":
          "Monolithic means 'from one stone,' hence a single silicon chip containing an integrated circuit.",
    },
    {
      "id": 1,
      "word": "Monolithic Microwave Integrated Circuit",
      "def":
          "A semiconductor circuit that contains more than one component and is fabricated on a semiconductor die.",
    },
    {
      "id": 1,
      "word": "monomer",
      "def":
          "The simple, unpolymerized form of a compound which is the building block of a polymer.",
    },
    {
      "id": 1,
      "word": "Monotonicity",
      "def": "The degree to which the slope of a function does not change sign",
    },
    {
      "id": 1,
      "word": "MOS IC",
      "def":
          "Metal-oxide-semiconductor integrated circuit. A digital IC whose transistors are all (or nearly all) composed of MOS transistors. MOS ICs are typically slower than TTL, but offer greater packaging density and lower power consumption. Varieties include PMOS, NMOS, and CMOS.",
    },
    {
      "id": 1,
      "word": "MOS transistor",
      "def":
          "Metal-oxide-semiconductor. A class of transistors that operate by means of an electric field produced by a voltage on a metal plate called the gate. The field acts through a thin layer of oxide insulation on a semiconductor channel, controlling its depth and therefore the current through the channel. See also FET, FET resistor, IGFET, CMOS, PMOS, and NMOS.",
    },
    {
      "id": 1,
      "word": "MOSFET",
      "def":
          "Metal-Oxide-Semiconductor-Field-Effect-Transistor - A transistor that consists of electrodes (the source and drain) placed at opposite ends of a silicon channel. On top of the channel and between the electrodes an insulating layer of silicon dioxide is formed, on top of which a metal pad (the gate) is deposited. An electric field is induced into the channel as a result of a potential that is externally applied to across the source and gate. This field modulates the resistance of the channel between the drain and source.",
    },
    {
      "id": 1,
      "word": "motherboard",
      "def":
          "A pc board on which connectors are mounted and interconnections are made with another pc board (daughterboard). A board-to-board application with the motherboard usually being the larger and containing other electronic subassemblies.",
    },
    {
      "id": 1,
      "word": "mother-daughter board connector",
      "def":
          "A connector designed for interconnection of printed circuit boards, typically with perpendicular engagement.",
    },
    {
      "id": 1,
      "word": "MPEG",
      "def": "moving pictures experts group",
    },
    {
      "id": 1,
      "word": "MPLS",
      "def": "multi-protocol label switching",
    },
    {
      "id": 1,
      "word": "MPP Core",
      "def":
          "MPP is an acronym for molypermalloy powder. It is a magnetic material that has an inherent distributed air gap. The distributed air gap allows the core to store higher levels of magnetic flux when compared to other magnetic materials such as ferrites. This characeristic allows a higher DC current level to flow through the inductor before the inductor saturates. The basic raw materials are nickel, iron and molybdenum. The ratios are: approximately 80% nickel, 2% -3% molybdenum, and the remaining is iron. The manufacturing process includes an annealing step as discussed in the Kool Mu (r) definition. MPP stores higher amounts of energy and has a higher permeability than Kool Mu (r) Cores are offered in 10 or more permeability selections. The core characteristics allow inductors to perform very well in switching power applications. Since higher energy can be stored by the core, more DC current can be passed thorugh the inductor before the core saturates. The cost of MPP is significantly higher than Kool Mu (r) , powdered irons and most ferrite cores with similar sizes (See saturation current and Kool Mu (r))",
    },
    {
      "id": 1,
      "word": "MS",
      "def": "Mobile system (eg. cellphone network)",
    },
    {
      "id": 1,
      "word": "MSAS",
      "def": "MTSAT Satellite based Augmentation System (See also WAAS, EGNOS)",
    },
    {
      "id": 1,
      "word": "MSI",
      "def": "See medium-scale integration.",
    },
    {
      "id": 1,
      "word": "MTBF",
      "def":
          "Mean Time Between Failure - Unit of measure, expressed in hours, that gives the relative reliability of a converter. MTBF data is based upson actual operating data (demonstrated) or derived per the conditions of MIL-HDBK-217F (calculated).",
    },
    {
      "id": 1,
      "word": "MT-RJ",
      "def": "A small form factor, dual fiber connector.",
    },
    {
      "id": 1,
      "word": "MTSAT",
      "def": "Multi-Task Satellite system",
    },
    {
      "id": 1,
      "word": "MTTF",
      "def":
          "mean time to failure - The measured operating time of a system or component divided by the number of failures that occurred during that time",
    },
    {
      "id": 1,
      "word": "MTU",
      "def": "multi-tenant unit",
    },
    {
      "id": 1,
      "word": "multichip IC",
      "def":
          "A special form of hybrid where two or more semiconductor chips are attached separately to a substrate.",
    },
    {
      "id": 1,
      "word": "Multiconductor",
      "def": "More than one component within a single-cable complex.",
    },
    {
      "id": 1,
      "word": "Multifilar Winding",
      "def":
          "A winding technique in which a single turn consists of two or more strands of magnetwire operating in parallel. This reduces some of the second order effects associated with a single strand of wire, including skin effect downfalls and winding ease.",
    },
    {
      "id": 1,
      "word": "multilayer board",
      "def":
          "A printed circuit board having traces not only on both sides but sandwiched between board layers.",
    },
    {
      "id": 1,
      "word": "Multimate",
      "def":
          "The standardization of given characteristics in several different contacts and a variety of connectors. By this means, contacts from varying price ranges and with differing performance characteristics (power, signal, optic, and coaxial) can be used interchangeably in a number of different connectors.",
    },
    {
      "id": 1,
      "word": "Multimode",
      "def":
          "A type of optical fiber in which the light travels in multiple paths. Utilizes LEDs or lasers as light sources.",
    },
    {
      "id": 1,
      "word": "multimode fiber",
      "def":
          "A fiber that allows a light signal to take various paths to arrive at the end of the fiber causing some light rays to arrive later than others.",
    },
    {
      "id": 1,
      "word": "Multiple-Conductor Cable",
      "def": "A combination of two or more components cabled together.",
    },
    {
      "id": 1,
      "word": "multiplex",
      "def":
          "The simultaneous transmission of two or more signals using a common carrier wave or a single path in a transmission system. Examples include the transmission of stereophonic fm broadcasts or multiple voices over a single telephone line.",
    },
    {
      "id": 1,
      "word": "multiplexer",
      "def":
          "MUX - An electronic device normally used to scan a number of input terminals and receive data from, or send data to, the same. Multiplexers are normally one of two types: 1) The cyclic type which continually and sequentially looks at each input for a request to send or receive data. 2) The random type which waits in a 'rest' position until other circuitry notifies it of a request to receive or send data.",
    },
    {
      "id": 1,
      "word": "Multiplier",
      "def":
          "A circuit whose output frequency is an integral multiple of the input frequency and whose output signal is coherent with the input signal. The critical component in a multiplier is typically a step recovery diode, Schottky diode, FET or varactor diode.",
    },
    {
      "id": 1,
      "word": "multiprogramming",
      "def":
          "A technique for handling numerous routines or programs in a manner that is seemingly simultaneous. This is done by overlapping or interleaving their execution (ie permitting more than one program to time share machine components).",
    },
    {
      "id": 1,
      "word": "Multi-user outlet",
      "def":
          "A work area outlet designed to support multiple users. Also called multi-user telecommunications outlet assembly or MUTOA.",
    },
    {
      "id": 1,
      "word": "MUTOA",
      "def":
          "A work area outlet designed to support multiple users. Also called multi-user telecommunications outlet assembly or MUTOA.",
    },
    {
      "id": 1,
      "word": "MUX",
      "def":
          "multiplexer - An electronic device normally used to scan a number of input terminals and receive data from, or send data to, the same. Multiplexers are normally one of two types: 1) The cyclic type which continually and sequentially looks at each input for a request to send or receive data. 2) The random type which waits in a 'rest' position until other circuitry notifies it of a request to receive or send data.",
    },
    {
      "id": 1,
      "word": "mW",
      "def": "Microwatt",
    },
    {
      "id": 1,
      "word": "MW",
      "def": "Milliwatt",
    },
    {
      "id": 1,
      "word": "n region",
      "def":
          "The region in a semiconductor where conduction electron density exceeds hole density. Also called n zone.",
    },
    {
      "id": 1,
      "word": "N Series",
      "def":
          "A large radio frequency connector covered by Military Specification. It has an impedance of 50ohms, and is designed to operate in the 0 to 11 GHz frequency range. It has a threaded coupling and is physically larger than a TNC connector.",
    },
    {
      "id": 1,
      "word": "NAB",
      "def":
          "Abbreviation for National Association of Broadcasters. For several years, prior to January 1, 1958, it was known as National Association of Radio and Television Broadcasters (NARTB).",
    },
    {
      "id": 1,
      "word": "nail head bonding",
      "def": "A synonym for ball bonding.",
    },
    {
      "id": 1,
      "word": "NAND gate",
      "def":
          "A logic circuit which performs the AND function and then inverts the result. A NOT-AND gate. See also AND gate, and NOR gate.",
    },
    {
      "id": 1,
      "word": "nano",
      "def":
          "A prefix that indicates a factor 10-9, which is 0.000000001 or one billionth, abbreviated as 'n.'",
    },
    {
      "id": 1,
      "word": "Nanosecond",
      "def": "One-billionth of a second, typically abbreviated as 'ns.'",
    },
    {
      "id": 1,
      "word": "Narrow Band",
      "def":
          "A vaguely defined term to indicate bandwidth less than approximately one-third of an octave (1/3 of the center frequency).",
    },
    {
      "id": 1,
      "word": "narrow-band EMI",
      "def":
          "EMI generated from a device operating at a specific and limited range of frequencies. See also EMI.",
    },
    {
      "id": 1,
      "word": "Natural Rubber",
      "def":
          "(NR-isoprene) Rubber by itself is lacking in many properties required of wire and cable insulating and jacketing materials. However, by proper compounding and mixing with other products, it can be converted to a material with excellent physical properties, good electrical properties, and fair to moderate ozone resistance and chemical resistance.",
    },
    {
      "id": 1,
      "word": "NAVSTAR",
      "def":
          "Navigation Satellite Timing and Ranging. (The official U.S. Government name given to the GPS satellite system)",
    },
    {
      "id": 1,
      "word": "NBR",
      "def": "Nitrile-Butadiene Rubber.",
    },
    {
      "id": 1,
      "word": "NBR/PVC",
      "def":
          "A blend of nitrile rubber and polyvinyl chloride, is recommended for oil and ozone resistant jacketing of flexible cord and fixture wires, cables, and ignition wires. NBR/PVC is said to offer toughness, smoothness, flame resistance, flexibility, and resistance to abrasion and heat deformation, and to give outstanding service when exposed to weather, light, fuel, oil, or ozone.",
    },
    {
      "id": 1,
      "word": "NC",
      "def":
          "Normally Closed meaning the state of the contacts when the control circuit is not energized.",
    },
    {
      "id": 1,
      "word": "NCC",
      "def": "network control center",
    },
    {
      "id": 1,
      "word": "NDIS",
      "def": "network drive interface specification",
    },
    {
      "id": 1,
      "word": "NEC",
      "def": "Abbreviation for National Electric Code.",
    },
    {
      "id": 1,
      "word": "Negative feedback",
      "def":
          "Recycling of a signal that is 180? out of phase with the input to decrease amplification. Used in linear circuits to stabilize performance and minimize distortion.",
    },
    {
      "id": 1,
      "word": "negative logic",
      "def":
          "Digital logic is termed negative when logic 0 is assigned the more positive level (ie higher voltage level than logic 1). Logic 1 is assigned the lower (more negative) level. It is the inverse of positive logic.",
    },
    {
      "id": 1,
      "word": "NEMA",
      "def": "Abbreviation for National Electrical Manufacturers Association.",
    },
    {
      "id": 1,
      "word": "neon",
      "def":
          "An inert element from Group O of the periodic table of chemical elements. Exists as a gas at normal temperatures and pressures. When ionized by current passing through it, as in neon signs, bulbs, pilot lights, test probes, etc, it produces a bright orange-red glow.",
    },
    {
      "id": 1,
      "word": "neoprene rubber",
      "def":
          "A synthetic rubber used for a wide variety of wire and cable jacketing applications. The physical properties are similar to natural rubber but with better resistance to oil, ozone, heat, weather, and aging. It does not support combustion and resists abrasion and cutting.",
    },
    {
      "id": 1,
      "word": "Network Analysis",
      "def":
          "The derivation of a network's electrical characteristics (input and output impedance, forward and reverse transfer characteristics, transient response, etc.) through its configuration, component values and response to driving signals.",
    },
    {
      "id": 1,
      "word": "Network Interface Card",
      "def":
          "NIC - The circuit board installed in a PC that provides the interface between a communicating PC and the network.",
    },
    {
      "id": 1,
      "word": "Network Management System",
      "def":
          "NMS - A system responsible for managing at least part of a network. NMSs communicate with agents to help keep track of network statistics and resources.",
    },
    {
      "id": 1,
      "word": "network-leased line",
      "def":
          "May refer to either a telephone or teletype network; usually has reference to telephone lines.",
    },
    {
      "id": 1,
      "word": "network-private wire",
      "def":
          "May refer to either private telephone or private teletype network.",
    },
    {
      "id": 1,
      "word": "network-telephone",
      "def":
          "A system of points interconnected by private voice-grade telephone whereby direct point-to-point telephone communications are provided. This traffic usually bypasses commercial switching facilities; the customer provides his own operating personnel for leased lines and facilities. Service is available from local common carriers.",
    },
    {
      "id": 1,
      "word": "network-teletype",
      "def":
          "A system of points, interconnected by private telegraph channels - which provide hard copy and/or telegraphic coded (five-channel) punched paper tape - at both sending and receiving points. Typically, up to 20 way stations share send-receive time on a single circuit. If two or more circuits are provided, a switching center is required to permit crosscircuit transmission.",
    },
    {
      "id": 1,
      "word": "NEXT",
      "def":
          "Near End Crosstalk.The unwanted noise coupled into a device's receive circuit from its transmit circuit.",
    },
    {
      "id": 1,
      "word": "next higher assembly",
      "def":
          "A term used to designate an assembly of the next higher level in the breakdown of a system.",
    },
    {
      "id": 1,
      "word": "NIC",
      "def": "Network interface card.Allows a PC to attach to a network.",
    },
    {
      "id": 1,
      "word": "Nick",
      "def": "A small cut or notch in conductor strands or insulation.",
    },
    {
      "id": 1,
      "word": "Nitrile-Butadiene Rubber",
      "def":
          "NBR - Specific properties depend on the actual composition but generally, this rubber offers excellent resistance to oils and solvents.",
    },
    {
      "id": 1,
      "word": "NMEA",
      "def":
          "National Marine Electronics Association - A U.S. standards committee that defines data message structure, contents, and protocols to allow the GPS receiver to communicate with other pieces of electronic equipment.",
    },
    {
      "id": 1,
      "word": "NMOS",
      "def":
          "N-channel metal-oxide semiconductor. A MOS IC using n-type material for the channels.",
    },
    {
      "id": 1,
      "word": "NO",
      "def":
          "Normally Open meaning the state of the contacts when the control circuit is not energized.",
    },
    {
      "id": 1,
      "word": "No Load Loss (Core Losses)",
      "def":
          "These losses are caused by the magnetizing of the core and are always present. The way they are measured is by running full voltage with no load on the transformer",
    },
    {
      "id": 1,
      "word": "No Load Voltage",
      "def":
          "Voltage level present at the output pins of a converter when 0% load is applied.",
    },
    {
      "id": 1,
      "word": "NOC",
      "def": "network operations center",
    },
    {
      "id": 1,
      "word": "node",
      "def":
          "(1) An end point to any branch of a network or a junction common to two or more branches. Terminals and other equipment that communicate over the network are nodes in a network. (2) A zero point. Specifically, a current node is a point of zero current; a voltage node is a point of zero voltage.",
    },
    {
      "id": 1,
      "word": "noise",
      "def":
          "An extraneous signal in an electrical circuit, capable of interfering with the desired signal. Loosely, any disturbance tending to interfere with the normal operation of a device or system. Classes of noise include burst or popcorn noise, intermediate frequency noise at low audio frequencies, white (thermal) noise, etc. Signals from power supply or ground line coupled into an amplifier output may be considered noise.",
    },
    {
      "id": 1,
      "word": "Noise Figure",
      "def":
          "The ratio of the input signal to noise ratio to the output signal to noise ratio for a circuit or system, expressed in decibels. The noise figure of a receiver determines the minimum detectable signal amplitude.",
    },
    {
      "id": 1,
      "word": "Noise Floor",
      "def":
          "The level of signal below which a receiver cannot detect a signal due to the noise generated within the receiver.",
    },
    {
      "id": 1,
      "word": "Noise margin",
      "def": "(VIL min VOL max) or (VOH min VIH max) which ever lowest.",
    },
    {
      "id": 1,
      "word": "Nominal",
      "def":
          "A descriptor applied to a dimension representing the center of the range of tolerance or a value if o tolerance is applied.",
    },
    {
      "id": 1,
      "word": "Nominal Value",
      "def":
          "Ideal value that is used as a reference point. Typically, it is not the same as the value actually measured.",
    },
    {
      "id": 1,
      "word": "Non-Harmonic Signals",
      "def":
          "Spurious signals produced by a circuit, the frequencies of which are not integral multiples of any signals either produced or processed by the circuit.",
    },
    {
      "id": 1,
      "word": "Nonlinear Material",
      "def":
          "Magnetic material that exhibits a permeability which changes dramatically when MMF is varied.",
    },
    {
      "id": 1,
      "word": "Non-Linearity",
      "def":
          "An impedance that does not linear relationship with voltage and current. The deviation of any parameter from a linear relationship with another.",
    },
    {
      "id": 1,
      "word": "Non-recurring Engineering",
      "def":
          "NRE - Engineering activity that is required to design, develop or enhance a product but is not required for the production of an existing product.",
    },
    {
      "id": 1,
      "word": "NOR gate",
      "def":
          "A logic circuit which performs the OR function and then inverts the result. A NOT-OR gate.",
    },
    {
      "id": 1,
      "word": "Normal Operating Current",
      "def":
          "The highest steady state current that is expected to flow in a circuit under normal operating conditions. At the maximum ambient operating temperature of the circuit, the hold current of a PolySwitch device used to protect the circuit is typically greater than the normal operating current.",
    },
    {
      "id": 1,
      "word": "NOT",
      "def":
          "The logical operator having that property which if P is a statement, then the not of P (P) is true if P is false, and the not of P (P) is false if P is true.",
    },
    {
      "id": 1,
      "word": "npn transistor",
      "def":
          "A bipolar transistor having a p-type base between an n-type emitter and an n-type collector. The emitter should be negative with respect to the base, and the collector should be positive with respect to the base.",
    },
    {
      "id": 1,
      "word": "NRE",
      "def":
          "non-recurring engineering - Engineering activity that is required to design, develop or enhance a product but is not required for the production of an existing product.",
    },
    {
      "id": 1,
      "word": "NRZ data rates",
      "def":
          "Nonreturn to zero. A datatransmission format in which a change of state is required each time a logical 1 is presented. NRZ requires half the transitions as a RZ format and can therefore transmit data at twice the speed. See also RZ data rates.",
    },
    {
      "id": 1,
      "word": "ntc",
      "def": "Negative temperature coefficient.",
    },
    {
      "id": 1,
      "word": "n-type",
      "def":
          "Semiconductor material that has been doped with donor impurity atoms that produce free electrons in the material. Conduction mode is by free electrons. Also such material when donor atoms predominate over acceptor atoms.",
    },
    {
      "id": 1,
      "word": "n-type conductivity",
      "def":
          "The conductivity associated with conduction electrons in a semiconductor.",
    },
    {
      "id": 1,
      "word": "N-type Material",
      "def":
          "A semiconductor material to which a donor dopant has been added, resulting in net negative charge",
    },
    {
      "id": 1,
      "word": "n-type semiconductor",
      "def":
          "An extrinsic semiconductor in which the conduction electron density exceeds the hole density. The net ionized impurity concentration is donor type.",
    },
    {
      "id": 1,
      "word": "numerical aperture",
      "def":
          "The light gathering ability of a fiber, defined as the sine of half the angle that contains 90% of the optical power that is captured by the fiber.",
    },
    {
      "id": 1,
      "word": "numerical control",
      "def":
          "Pertaining to the automatic control of processes by proper machine interpretation of numerical data.",
    },
    {
      "id": 1,
      "word": "nylon",
      "def":
          "The generic name for synthetic fiber- forming polyamides. Available in three forms for wires and cables: as a yarn for wire sleeving and braid; as an extrusion material (primarily for jackets); and as a coating.",
    },
    {
      "id": 1,
      "word": "OCR",
      "def": "See optical character recognition.",
    },
    {
      "id": 1,
      "word": "O-crimp",
      "def":
          "An insulation support crimp for open barrel terminals (and contacts). Its crimped form resembles an 'O' and conforms to the shape of the round wire insulation. O-crimp is also used to describe the circumferential crimps used on round, tubular ferrules.",
    },
    {
      "id": 1,
      "word": "octal",
      "def":
          "The octal number system has a radix (base) of 8, whereas the decimal system is to the base 10. The octal system, therefore, has eight distinct digits, namely 0, 1, 2, 3, 4, 5, 6, and 7. AMP has the capability of making switches which use octal code.",
    },
    {
      "id": 1,
      "word": "Octave",
      "def":
          "A frequency interval whose maximum value is twice the minimum value",
    },
    {
      "id": 1,
      "word": "Octave Band",
      "def":
          "A frequency interval whose maximum value is twice the minimum value",
    },
    {
      "id": 1,
      "word": "OD",
      "def": "Outside diameter.",
    },
    {
      "id": 1,
      "word": "OEM",
      "def": "original equipment manufacturer",
    },
    {
      "id": 1,
      "word": "Oersted",
      "def":
          "The unit of magnetic field strength (H) in the CGS system. One Oersted equals the magnetomotive force of one Gilbert per centimeter of flux path.",
    },
    {
      "id": 1,
      "word": "off-line memory",
      "def":
          "Any memory media capable of being stored remotely from the computer, which can be read by the computer when placed into a suitable reading device. For example, decks of punched cards, reels of magnetic tape, or disks.",
    },
    {
      "id": 1,
      "word": "Off-Line Power Supply",
      "def":
          "Power supply (linear or switching) that operates directly off the AC line. The input voltage is rectified and filtered prior to any isolation transformer.",
    },
    {
      "id": 1,
      "word": "offset current",
      "def":
          "An operational amplifier characteristic. The difference in current at the two inputs to bring the output voltage to zero.",
    },
    {
      "id": 1,
      "word": "Off-State Capacitance",
      "def":
          "Capacitance in the off-state measured at a specified frequency, amplitude, and DC bias.",
    },
    {
      "id": 1,
      "word": "Off-State Current",
      "def":
          "DC value of the current through a SiBar device that results from the application of the off-state voltage, VD. IDM designates the maximum off-state current.",
    },
    {
      "id": 1,
      "word": "Off-State Voltage",
      "def":
          "DC voltage when a SiBar device is in the off-state. VDM designates the maximum off-state voltage.",
    },
    {
      "id": 1,
      "word": "OFT",
      "def":
          "Optional Flame Test - Canadian Standards Association?s test for flameretardance. Tubing with an OFT rating is highly flameretardant.",
    },
    {
      "id": 1,
      "word": "ohm",
      "def":
          "The unit of measurement for electrical resistance. A circuit is said to have a resistance of one ohm when an applied emf of one volt causes a current of one ampere to flow.",
    },
    {
      "id": 1,
      "word": "Ohm's Law",
      "def":
          "The law that relates voltage and current in a circuit. Ohm's Law is:",
    },
    {
      "id": 1,
      "word": "ohms per square",
      "def":
          "A unit for measurement of resistor value by topological shape. It is based on the fact that the resistance of a square of resistor material is independent of the dimensions of the square. A resistor topology can be considered to be made up of contiguous squares. The value of the resistor is the product of the number of squares and the ohms per square.",
    },
    {
      "id": 1,
      "word": "olefin",
      "def":
          "Types of unsaturated aliphatic hydrocarbons, including ethylene, propylene, and butene. They are the bases for such plastics as polypropylene and polyethylene.",
    },
    {
      "id": 1,
      "word": "on-line memory",
      "def":
          "A memory media, with direct electrical interconnections, used as a nonremovable part of a computer system. For example, ROM ICs.",
    },
    {
      "id": 1,
      "word": "On-State Current",
      "def": "Current through a SiBar device in the on-state condition IT.",
    },
    {
      "id": 1,
      "word": "On-State Voltage",
      "def":
          "Voltage across a SiBar device in the on-state condition at a specified current, IT.",
    },
    {
      "id": 1,
      "word": "open barrel",
      "def":
          "The portion(s) of a terminal, splice, or contact that is crimped. When designed to receive the conductor, it is called the wire barrel. When designed to support or grip the insulation, it is called the insulation barrel. Wire and/or insulation barrels may be either 'open' or 'closed' in design. Closed barrels resemble a hollow cylinder into which the wire must be inserted. Open barrels are formed into an open 'U' and are common to most strip terminals manufactured by AMP Incorporated.",
    },
    {
      "id": 1,
      "word": "Open Circuit Inductance (LO)",
      "def":
          "The inductance measured at the winding of a transformer at a low flux density level.",
    },
    {
      "id": 1,
      "word": "open loop",
      "def":
          "Refers to operation of an amplifier without feedback, as opposed to closed loop which is operation with feedback.",
    },
    {
      "id": 1,
      "word": "Open Systems Interconnection(OSI)",
      "def":
          "A 7-layer architecture model for communications systems developed by ISO and used as a reference model for most network architectures.",
    },
    {
      "id": 1,
      "word": "Open-Circuit Voltage",
      "def": "See No Load Voltage.",
    },
    {
      "id": 1,
      "word": "operand",
      "def":
          "One of the quantities entering into, or arising from, a computer operation. An operand may be an argument, a parameter, a result, or the location code for the next instruction.",
    },
    {
      "id": 1,
      "word": "Operate Time",
      "def":
          "The time interval between the coil energization (nominal coil voltage) and the closing of all normally open contacts. This includes time for the coil to build up its magnetic field (a significant limiting factor) and transfer time of the moveable contact between station-ary contact(s), and bounce time after the initial contact make. All Kilovac relays, except 'AP' and 'PD' power switching products include bounce time.",
    },
    {
      "id": 1,
      "word": "Operating Range Current",
      "def":
          "The range of normal operating currents in a circuit containing a PolySwitch device. Typically the hold current of the PolySwitch device should be greater than the top of the operating current range.",
    },
    {
      "id": 1,
      "word": "operating system",
      "def":
          "An organized collection of techniques and procedures for operating a computer. Specifically, a software package defined to simplify housekeeping and such routine chores as input/output, disk reading, and data conversion.",
    },
    {
      "id": 1,
      "word": "Operating Temperature",
      "def":
          "The maximum internal temperature at which a system, harness, or connector ay operate in continuous service; generally expressed as a time and temperature.",
    },
    {
      "id": 1,
      "word": "Operating Temperature Range",
      "def":
          "The specified temperature range over which a circuit or component is designed to operate without damage.",
    },
    {
      "id": 1,
      "word": "operating time",
      "def":
          "The time interval between satisfaction of the specified input conditions and the occurrence of the specified operation.",
    },
    {
      "id": 1,
      "word": "operational amplifier",
      "def":
          "op amp - Originally, an amplifier to perform mathematical operations. An amplifier with two differentially connected inputs, with high voltage gain, and with one output - which ideally is at zero volts when both inputs are at zero volts. It must also be capable of accepting negative feedback without oscillating.",
    },
    {
      "id": 1,
      "word": "optical character recognition",
      "def":
          "Automatic recognition of printed characters with a character reader. Commonly referred to by the abbreviation OCR.",
    },
    {
      "id": 1,
      "word": "optical fiber",
      "def":
          "Also called fiber-optic cable. A thin, flexible glass or plastic fiber capable of transmitting light over considerable distances by internal reflection.",
    },
    {
      "id": 1,
      "word": "Optional Flame Test",
      "def":
          "OFT - Canadian Standards Association?s test for flameretardance. Tubing with an OFT rating is highly flameretardant.",
    },
    {
      "id": 1,
      "word": "OQPSK",
      "def": "Offset quadrature phase shift key modulation.",
    },
    {
      "id": 1,
      "word": "OR gate",
      "def":
          "A multiple-input gate circuit whose output is energized when any one or more of the inputs is in a prescribed state. Used in digital logic.",
    },
    {
      "id": 1,
      "word": "oscillator",
      "def":
          "(1) Any nonrotating device for setting up and maintaining oscillations of a frequency determined by the physical constants of the system. ( 2) A device for producing electric oscillations; specifically a radio-frequency or audio-frequency generator (especially of the nonrotating type).",
    },
    {
      "id": 1,
      "word": "OSS",
      "def": "operational support system",
    },
    {
      "id": 1,
      "word": "Outlet",
      "def": "Where the horizontal cabling terminates in the work area.",
    },
    {
      "id": 1,
      "word": "output",
      "def":
          "Information transferred from the internal storage of a computer to output devices or external storage.",
    },
    {
      "id": 1,
      "word": "Output Current Limiting",
      "def":
          "Feature that protects the converter (or load) from damage under overload conditions. The maximum converter output current is automatically limited to a predetermined safe value. If the converter is specified for auto restart, normal operatoin is automatically restored when overload condition is removed.",
    },
    {
      "id": 1,
      "word": "Output Filter",
      "def":
          "A low pass filter placed in the output of the rectified power converter to minimize (or smooth) the square wave or sine wave output of the converter. This filter has an LC,RC or Pi configuration.",
    },
    {
      "id": 1,
      "word": "Output Impedance",
      "def":
          "Ratio of change in output voltage to a change in output load current. Sometimes referred to as Dynamic Response.",
    },
    {
      "id": 1,
      "word": "Output Ripple and Noise",
      "def": "See Noise and Periodic and Random Distribution.",
    },
    {
      "id": 1,
      "word": "Output Voltage",
      "def":
          "Value of DC voltage measured at the output terminal of a converter.",
    },
    {
      "id": 1,
      "word": "Output Voltage Accuracy",
      "def":
          "Maximum allowable deviation of the DC output of a converter from its ideal or nominal value. Expressed as a percentage of output voltage. Often called output voltage tolerance",
    },
    {
      "id": 1,
      "word": "Output Voltage Range",
      "def":
          "Minimum and maximum output voltage limits within which a converter meets its operating specifications.",
    },
    {
      "id": 1,
      "word": "ovaled",
      "def":
          "A terminal (or contact) whose barrel has been made oval in shape to aid in placing two wires in the barrel.",
    },
    {
      "id": 1,
      "word": "Overcurrent Protection",
      "def":
          "Output monitoring circuit activated if the converter exceeds a preset current level.",
    },
    {
      "id": 1,
      "word": "Overload Protection",
      "def": "See Current Limiting and Foldback Current Limiting.",
    },
    {
      "id": 1,
      "word": "Overshoot",
      "def":
          "Transient change in output voltage that exceeds specified accuracy limits. Typically occurs on converter turn on/off or with a step change in output load or input line.",
    },
    {
      "id": 1,
      "word": "Overtemperature Protection",
      "def":
          "Design feature that protects the silicon die from exceeding its designed operating temperature range. The device will thermally cycle until the abnormal condition is corrected.",
    },
    {
      "id": 1,
      "word": "Overvoltage",
      "def":
          "Voltage for a circuit exceeds the allowable limit for that circuit. Can be transient or long-lasting.",
    },
    {
      "id": 1,
      "word": "Overvoltage Lockout",
      "def":
          "Design feature that protects the silicon die and downstream peripherals from supply voltage conditions that exceed its operating voltage limits. Raychem power switches have a nominal OVLO threshold of 6.4V.",
    },
    {
      "id": 1,
      "word": "Overvoltage Protection (OVP)",
      "def":
          "Output monitoring circuit activated if a preset voltage level is exceeded. Depending on the type of circuit used, the OVP shuts the converter down, 'crowbars' the faulty output or switches the converter to a different operating mode.",
    },
    {
      "id": 1,
      "word": "OVLO",
      "def":
          "Design feature that protects the silicon die and downstream peripherals from supply voltage conditions that exceed its operating voltage limits. Raychem power switches have a nominal OVLO threshold of 6.4V.",
    },
    {
      "id": 1,
      "word": "OXC",
      "def": "optical cross-connect",
    },
    {
      "id": 1,
      "word": "oxide",
      "def":
          "A compound of oxygen with one or more metallic elements. Rust is an oxide of iron.",
    },
    {
      "id": 1,
      "word": "Oxide Passivation",
      "def":
          "A layer of oxide, usually silicon dioxide either formed from the surface of a semiconductor die or deposited on the surface of a the die using chemical vapor deposition.",
    },
    {
      "id": 1,
      "word": "oxygen index",
      "def":
          "The minimum concentration of oxygen, expressed as volume percent, in a mixture of oxygen and nitrogen that will just support flaming combustion of plastic initially at room temperature.",
    },
    {
      "id": 1,
      "word": "ozone",
      "def":
          "An extremely reactive form of oxygen, normally occurring around electrical discharges. It is faintly blue and has the odor of weak chlorine. In sufficient concentrations, it can break down certain rubber insulations under tension (such as a bent cable).",
    },
    {
      "id": 1,
      "word": "P1dB",
      "def": "(See '1 dB Compression Point')",
    },
    {
      "id": 1,
      "word": "PA",
      "def":
          "power amplifier - An amplifier intended to increase the power of a signal enough to drive a load such as an antenna. Typically, power amplifiers also have large values for P1dB, indicating low distortion at high output power.",
    },
    {
      "id": 1,
      "word": "Package",
      "def":
          "Container for a semiconductor die that protects it and has electrodes that facilitate electrical connection of the die to the external circuit.",
    },
    {
      "id": 1,
      "word": "Packaging",
      "def":
          "The process of physically locating, connecting, and protecting devices or components.",
    },
    {
      "id": 1,
      "word": "Packet",
      "def":
          "(1)A logical grouping of information that includes a header and (usually) user data. (2) Continuous sequence of binary digits of information is switched through the network and an integral unit.",
    },
    {
      "id": 1,
      "word": "Packet Switched Network",
      "def":
          "A network in which data is transmitted in units called packets. The packets can be routed individually over the best available network connection and reassembled to form a complete message at the destination.",
    },
    {
      "id": 1,
      "word": "packet switching",
      "def":
          "(systems) A data transmission process, using addressed packets of data, whereby the communication channel is occupied only for the duration of the transmission of the packet.",
    },
    {
      "id": 1,
      "word": "pad",
      "def":
          "(1) On printed circuit boards, the portion used for making electrical connections to the conductive pattern, such as the enlarged areas where component leads are soldered. See also land, and terminal area. On integrated circuits, the bonding pad. (2) Attenuator, or to attenuate.",
    },
    {
      "id": 1,
      "word": "Pair Gain",
      "def":
          "The multiplexing of x phone conversations over a lesser number of physical capabilities. 'Pair gain' is the number of conversations obtained, divided by the number of wire pairs used by the systems.",
    },
    {
      "id": 1,
      "word": "PAL",
      "def":
          "Programmable Array Logic : PAL is an AND gate array whose outputs are Ored together in a way determined by the manufacturer of the device.",
    },
    {
      "id": 1,
      "word": "PAN",
      "def": "personal area network",
    },
    {
      "id": 1,
      "word": "Panel",
      "def":
          "The side or front (usually metal) of a piece of equipment on which connectors are mounted.",
    },
    {
      "id": 1,
      "word": "panel mount",
      "def":
          "A method of fixing a connector to a board, panel, or frame. The mounted connector is usually the receptacle or female connector. The plug or male connector is usually the removable portion.",
    },
    {
      "id": 1,
      "word": "parallel circuit",
      "def":
          "A circuit in which two or more loads are connected to a single voltage source, at a common point.",
    },
    {
      "id": 1,
      "word": "parallel operation",
      "def":
          "(1) In computers, the simultaneous transmission of data on separate lines. For example, all bits of an 8-bit word are sent simultaneously on eight separate lines. Parallel operation is much faster than serial operation, but requires more circuitry. (2) Operating Mode in which two or more power supplies are connected in parallel. The output currents are summed together into a single load, providing a higher level of output power than that available from a single DC-DC. Parallel operation requires DC-DCs speed specifically designed to share loads. Also see Master-Slave Operation.",
    },
    {
      "id": 1,
      "word": "parallel splice",
      "def":
          "A splice wherein two wires are joined together side-by-side, either from the same end of the splice, or from opposite ends of the splice.",
    },
    {
      "id": 1,
      "word": "Parameter",
      "def": "A measurable electrical characteristic.",
    },
    {
      "id": 1,
      "word": "PARD",
      "def":
          "Periodic and Random Deviation - Noise and ripple voltage superimposed on a converter's DC output. Typically specified at full load, it is expressed in peak-to-peak or RMS volts over a given bandwidth.",
    },
    {
      "id": 1,
      "word": "parity",
      "def":
          "A method by which binary numbers can be checked for accuracy. An extra bit, called a parity bit, is added to numbers in systems using parity. If even parity is used, the sum of all 1's in a number and its parity bit is always even. If odd parity is used, the sum of 1's in a number and its parity bit is always odd.",
    },
    {
      "id": 1,
      "word": "parity bit",
      "def":
          "A binary digit appended to an array of bits to make the sum of all the bits always odd or always even.",
    },
    {
      "id": 1,
      "word": "parity check",
      "def":
          "A technique for detecting errors. It consists of summing the 1's in a specific length of data and recording whether the sum was odd or even in a parity bit line. A single error would change the sum and thus be detected. Stated another way: a check that tests whether the number of 1's (or 0's) in an array of binary digits is odd or even.",
    },
    {
      "id": 1,
      "word": "parts density",
      "def": "The number of parts per unit volume.",
    },
    {
      "id": 1,
      "word": "Pascal",
      "def":
          "A high-level, highly structured, general-purpose programming language. Named after Blaise Pascal.",
    },
    {
      "id": 1,
      "word": "Passband",
      "def":
          "The frequency interval that is propagated through a filter with minimum insertion loss.",
    },
    {
      "id": 1,
      "word": "Passband Ripple",
      "def": "The amplitude variation within the passband of filter.",
    },
    {
      "id": 1,
      "word": "Passivation",
      "def":
          "A layer of material on a semiconductor die that protects it from external contamination and chemically ties up any unbound charges that may exist on the surface as a result of the discontinuation of the semiconductor crystal at the surface. For silicon devices, the passivation is often a layer of silicon dioxide (Si02) that is formed by oxidizing the surface of the silicon at temperatures around 1000 ?C. For gallium arsenide devices, a layer of silicon nitride (Si3N4) is often deposited on the surface of the GaAs for passivation.",
    },
    {
      "id": 1,
      "word": "Passive",
      "def": "Unable to amplify or produce energy.",
    },
    {
      "id": 1,
      "word": "Passive Aging Test",
      "def":
          "A test described in Raychem's PS300 publication in which the resistance of a PolySwitch device at room temperature is measured before and after aging at an elevated temperature (e.g., 70?C or 85?C) for an extended time (e.g., 1000 hours).",
    },
    {
      "id": 1,
      "word": "Passive Components",
      "def":
          "Devices that do not amplify or produce a signal. Components which have no gain characteristics, such as capacitors and resistors.",
    },
    {
      "id": 1,
      "word": "Passive Device",
      "def":
          "Devices that do not amplify or produce a signal. Components which have no gain characteristics, such as capacitors and resistors.",
    },
    {
      "id": 1,
      "word": "passive element",
      "def":
          "Devices that do not amplify or produce a signal. Components which have no gain characteristics, such as capacitors and resistors.",
    },
    {
      "id": 1,
      "word": "Passive Network",
      "def":
          "Devices that do not amplify or produce a signal. Components which have no gain characteristics, such as capacitors and resistors.",
    },
    {
      "id": 1,
      "word": "passive substrate",
      "def":
          "A support made of insulating material used as a base for the deposition of film components.",
    },
    {
      "id": 1,
      "word": "Patch cord",
      "def":
          "A cable assembly with (usually) a plug on each end, used to make a cross connection.",
    },
    {
      "id": 1,
      "word": "Patch panel",
      "def":
          "A rack-mountable panel (usually 19' wide) containing connecting hardware.Used to patch between groups of cables and equipment.",
    },
    {
      "id": 1,
      "word": "patchcord programming system",
      "def":
          "A switching device that can be programmed by using patchcords to complete the desired circuits. Basically, these systems are general purpose manually operated switches, which permit, through proper patchcord selection and placement, nearly infinite switching combinations. Further, because the patchboards are removable, any program can be retained and stored.",
    },
    {
      "id": 1,
      "word": "path",
      "def":
          "That portion of a printed circuit pattern which carries current between two pads or between a pad and the terminal area (printed contact, edge pad). See also pad, and terminal area.",
    },
    {
      "id": 1,
      "word": "Path Loss",
      "def":
          "The reduction in transmitted power as measured at a receiver due the distance the signal traveled from the transmitter, atmospheric absorption and other factors.",
    },
    {
      "id": 1,
      "word": "PBX",
      "def":
          "Private Branch Exchange.The premises telephone switch.Handles telecom functions.",
    },
    {
      "id": 1,
      "word": "PC",
      "def":
          "Production Control - Group responsible for directing and regulating the movement of goods through the entire manufacturing cycle, from the requisitioning of raw materials to the delivery of the finished products.",
    },
    {
      "id": 1,
      "word": "PCB",
      "def":
          "Printed Circuit Board - An insulating board serving as a base for a printed circuit. When the printing process is completed, the board may include printed components, as well as printed wiring.",
    },
    {
      "id": 1,
      "word": "PCCL",
      "def": "Pulse-coupled complementary logic.",
    },
    {
      "id": 1,
      "word": "pcm",
      "def":
          "Pulse code modulation. A scheme by which an analog signal is sampled and converted to a digital signal for transmission.",
    },
    {
      "id": 1,
      "word": "PCN",
      "def": "Personal Communications Network.",
    },
    {
      "id": 1,
      "word": "PCS",
      "def":
          "Personal Communications Services. A term used in the United States for any mobile telephone services in the 1900 MHz frequency band.",
    },
    {
      "id": 1,
      "word": "Pd",
      "def":
          "The power (in watts) dissipated by a PolySwitch device in its tripped state. The power dissipation is the product of the current flowing through the device and the voltage across the device, in the tripped state.",
    },
    {
      "id": 1,
      "word": "PDOP",
      "def": "Position DOP",
    },
    {
      "id": 1,
      "word": "Peak On-state Surge Current",
      "def": "Current through the device in the on-state condition.",
    },
    {
      "id": 1,
      "word": "Peak Power",
      "def": "The maximum instantaneous power of a signal.",
    },
    {
      "id": 1,
      "word": "Peak Pulse Current",
      "def":
          "Rated maximum value of peak pulse current of specified amplitude and waveshape.",
    },
    {
      "id": 1,
      "word": "peaks",
      "def":
          "Momentary high amplitude levels occurring in electronic equipment.",
    },
    {
      "id": 1,
      "word": "Peak-to-Peak",
      "def":
          "The magnitude of the arithmetic difference between the maximum and minimum values for a varying quantity.",
    },
    {
      "id": 1,
      "word": "Peak-to-Peak Amplitude",
      "def":
          "The magnitude of the arithmetic difference between the maximum and minimum values for a varying quantity.",
    },
    {
      "id": 1,
      "word": "Percent Bandwidth",
      "def":
          "The bandwidth divided by the center frequency of the band, expressed as a percentage.",
    },
    {
      "id": 1,
      "word": "Percent Ripple",
      "def":
          "The percentage of ripple or AC flux to total flux, or in an inductor, the percentage of alternating current to average current.",
    },
    {
      "id": 1,
      "word": "Percent Saturation",
      "def":
          "The 100% permeability minus the percent of initial permeability. ie 20% saturation = 80% of initial permeability.",
    },
    {
      "id": 1,
      "word": "Period",
      "def": "Duration.",
    },
    {
      "id": 1,
      "word": "Periodic and Random Deviation",
      "def":
          "PARD - Noise and ripple voltage superimposed on a converter's DC output. Typically specified at full load, it is expressed in peak-to-peak or RMS volts over a given bandwidth.",
    },
    {
      "id": 1,
      "word": "peripheral equipment",
      "def":
          "Equipment separate from the main computer; includes all forms of attachments to main computer systems.",
    },
    {
      "id": 1,
      "word": "Peripheral Seal",
      "def":
          "A seal provided around the periphery of connector inserts to prevent the ingress of fluids or contaminants at the perimeter of mated connectors.",
    },
    {
      "id": 1,
      "word": "peripheral seal",
      "def":
          "A design feature which provides an environmental seal between the forward end of plug and forward end of the receptacle even though they are not fully engaged. It generally consists of a piece of rubber fastened around the inner sidewall of the receptacle front opening skirt or around the outer sidewall of the plug engagement section.",
    },
    {
      "id": 1,
      "word": "Permanent Virtual Circuit",
      "def":
          "PVC - A defined virtual link with fixed end-points that are set-up by the network manager. A single virtual path may support multiple PVCs.",
    },
    {
      "id": 1,
      "word": "Permeability",
      "def":
          "(1) The passage or diffusion (or rate of passage) of a gas, vapor, liquid, or solid through a barrier without physically or chemically affecting it. (2) The measure of how much better a given material is than air as a path for magnetic lines of force; The ratio of the changes in flux density to changes in the magnetizing force. The permeability of a magnetic material is the characteristic that gives the core the ability to concentrate lines of magnetic flux. The core material, as well as the core geometry, affects the core?s effective permeability. For a given core shape, size, and winding, higher permeability materials result in higher inductance values as opposed to lower permeability materials. The symbol for permeability is '?'. For free space, ? = 1.",
    },
    {
      "id": 1,
      "word": "Permittivity",
      "def":
          "(also K) The ratio of the capacitance between two electrodes with a solid, liquid, or gaseous dielectric, to the capacitance with air between the electrodes. Also called permittivity and specific inductive capacity.Generally low values are desirable for insulation.",
    },
    {
      "id": 1,
      "word": "peta",
      "def": "A prefix that indicates a factor 1015, abbreviated as 'P.'",
    },
    {
      "id": 1,
      "word": "PGA",
      "def":
          "pin grid array - A ceramic substrate with rows of short round pins extending out the bottom in an x-y or fence array.",
    },
    {
      "id": 1,
      "word": "Phase",
      "def":
          "In a periodic function, the fraction of a period that has elapsed since some arbitrary reference point.",
    },
    {
      "id": 1,
      "word": "Phase Angle",
      "def":
          "The angle obtained by multiplying the phase of a periodic function by 360 if the angle is to be expressed in degrees, by 2p if the angle is expressed in radians, or by 400 if the angle is expressed in grads.",
    },
    {
      "id": 1,
      "word": "phase control",
      "def":
          "A circuit technique for proportional control of an output signal by conduction only during certain phases of an ac line voltage.",
    },
    {
      "id": 1,
      "word": "Phase Lock",
      "def":
          "The technique of forcing the phase of an oscillator to follow the phase of a second, highly stable reference oscillator by comparing the phase angle between the two signals and applying an appropriate correction signal to the oscillator that is to be controlled.",
    },
    {
      "id": 1,
      "word": "phase locked loop",
      "def":
          "In communications, a circuit technique by which a local oscillator is synchronized in phase and frequency with a signal being received.",
    },
    {
      "id": 1,
      "word": "Phase Modulation",
      "def":
          "PM - The modification of the phase of a higher frequency, constant magnitude carrier signal controlled by the amplitude and phase of a lower frequency baseband or audio signal.",
    },
    {
      "id": 1,
      "word": "Phase Modulator",
      "def": "A circuit that produces phase modulation of a carrier signal.",
    },
    {
      "id": 1,
      "word": "Phase Noise",
      "def": "A measure of the random phase instability of a signal.",
    },
    {
      "id": 1,
      "word": "Phase Shift",
      "def": "The change in phase of a periodic quantity.",
    },
    {
      "id": 1,
      "word": "Phase Shifter",
      "def": "A circuit or system that is designed to produce phase shift.",
    },
    {
      "id": 1,
      "word": "phase splitter",
      "def":
          "A circuit which generates - out of an ac input signal - two equal-amplitude outputs, one of which is 180 out of phase with the other (ie one is the other inverted). The dc levels may not be identical.",
    },
    {
      "id": 1,
      "word": "phenolic",
      "def":
          "A thermosetting plastic material available in many combinations of phenol and formaldehyde. Often there are fillers added to provide a broad range of physical, electrical, chemical, and molding properties. Commonly used for housings, inserts, and programming system panels.",
    },
    {
      "id": 1,
      "word": "photodetector",
      "def":
          "A device that is sensitive to light and will produce an electric current in its presence.",
    },
    {
      "id": 1,
      "word": "photoresist",
      "def":
          "A lightsensitive organic coating that can be selectively deposited to resist the action of the etchant (etching solution) and produce the desired circuit pattern.",
    },
    {
      "id": 1,
      "word": "PHS",
      "def": "Personal Handy Phone System",
    },
    {
      "id": 1,
      "word": "pi",
      "def":
          "A lumped-element filter using, for low pass, two parallel capacitive elements and a series inductive element between them.",
    },
    {
      "id": 1,
      "word": "Pick",
      "def": "The number of crossovers of braiding units per inch of cable.",
    },
    {
      "id": 1,
      "word": "pickup value",
      "def": "The minimum value which will energize the contacts of a relay.",
    },
    {
      "id": 1,
      "word": "pico",
      "def": "A prefix meaning 10-12, or one trillionth, abbreviated as 'p.'",
    },
    {
      "id": 1,
      "word": "Pi-Filter",
      "def":
          "A filter consisting of two capacitors connected in parallel with a series inductor. These fileters arc commoonly found near DC-DC converters to filter ripple curent and voltage.",
    },
    {
      "id": 1,
      "word": "pigments",
      "def":
          "Coloring matter, often in powder form, having a wide range of colors and physical properties.",
    },
    {
      "id": 1,
      "word": "Pigtail",
      "def":
          "(1) A short conductor or wire extending from an electrical or electronic device to serve as a jumper or ground connection. (2) A source or detector that is permanently joined to a short length of fiber in manufacturing with epoxy enabling the fiber to be brought very close to the semiconductor chip for maximum efficiency.",
    },
    {
      "id": 1,
      "word": "Pigtail",
      "def":
          "A short length of fiber permanently attached to a component, such as a source, detector, or coupler.",
    },
    {
      "id": 1,
      "word": "pin contact",
      "def":
          "A male type contact, usually designed to mate with a socket or female contact. It is normally connected to the 'dead' side of a circuit.",
    },
    {
      "id": 1,
      "word": "p-i-n Diode",
      "def":
          "A three-layer semiconductor diode consisting of an intrinsic layer separating heavily doped P and N layers. The charge stored in the intrinsic layer in conjunction with other diode parameters determines the resistance of the diode at RF and microwave frequencies. This resistance typically ranges from kilohms to less than 1 ohm for a given diode. A PIN diode is typically used as a switch or attenuator element.",
    },
    {
      "id": 1,
      "word": "pin grid array",
      "def":
          "PGA - A ceramic substrate with rows of short round pins extending out the bottom in an x-y or fence array.",
    },
    {
      "id": 1,
      "word": "Pin photodiode",
      "def":
          "A photodiode having a large intrinsic layer sandwiched between p-type and n-type layers.",
    },
    {
      "id": 1,
      "word": "Pinch-Off",
      "def":
          "The cessation of drain-source current flow in a field effect transistor.",
    },
    {
      "id": 1,
      "word": "Pinch-Off Voltage",
      "def":
          "The gate-source voltage required to stop drain-source current flow in a field effect transistor.",
    },
    {
      "id": 1,
      "word": "pinholes",
      "def":
          "Small holes occurring as imperfections, which extend through the printed element to the base. (Examples: holes in screened resistors, thin film elements, screened epoxy masks.)",
    },
    {
      "id": 1,
      "word": "Pistoning",
      "def":
          "The movement of a fiber axially in and out of a ferrule end, often caused by changes in temperature.",
    },
    {
      "id": 1,
      "word": "pits",
      "def":
          "Small holes occurring as imperfections which do not penetrate entirely through the printed element.",
    },
    {
      "id": 1,
      "word": "planar",
      "def":
          "(1) Of, pertaining to or contained in a single geometric plane. (2) A process for fabricating semiconductor devices and monolithic integrated circuits that uses silicon dioxide as a masking agent. The result is lower density than MOS, but faster switching speeds. The lower density - from having all components on a single plane - makes this process impractical for LSI.",
    },
    {
      "id": 1,
      "word": "plastic",
      "def":
          "High polymeric substances, including both natural and synthetic products, but excluding the rubbers, that are capable of flowing under heat and pressure at one time or another.",
    },
    {
      "id": 1,
      "word": "Plastic Deformation",
      "def":
          "Change in dimensions under a load that does not recover when the load is removed.",
    },
    {
      "id": 1,
      "word": "Plastic fiber",
      "def": "An optical fiber having a plastic core and plastic cladding.",
    },
    {
      "id": 1,
      "word": "Plastic-clad silica fiber",
      "def": "An optical fiber having a glass core and plastic cladding.",
    },
    {
      "id": 1,
      "word": "plasticizers",
      "def":
          "Chemical materials incorporated in a plastic to increase its workability during processing, and to impart flexibility and other desirable properties, such as flame retardance and increased electrical insulating properties, to the finished product.",
    },
    {
      "id": 1,
      "word": "plated-thru hole",
      "def":
          "A drilled hole in a printed circuit board which has been plated to establish electrical continuity from one side of the board to the other.",
    },
    {
      "id": 1,
      "word": "Plating",
      "def":
          "The overlaying of a thin coating of metal on metallic components to improve conductivity, facilitate soldering, or prevent corrosion.",
    },
    {
      "id": 1,
      "word": "PLD",
      "def": "Programmable Logic Device",
    },
    {
      "id": 1,
      "word": "Plenum",
      "def":
          "The air space between walls, under structural floors, and above drop ceilings, which can be used to route intrabuilding cabling. Plenum-rated cable is required in such locations.",
    },
    {
      "id": 1,
      "word": "Plenum cable",
      "def":
          "A cable whose flammability and smoke characteristics allow it to be routed in a plenum area without being enclosed in a conduit.",
    },
    {
      "id": 1,
      "word": "Plug",
      "def":
          "The part of a connector that is normally ?removable? from the other, permanently mounted part; usually that half of a two-piece connector that contains the pin contacts.",
    },
    {
      "id": 1,
      "word": "plug",
      "def":
          "In coaxial rf connectors the plug is normally the movable portion and is usually attached to a cable or removable subassembly. In shell type multiple-contact connectors the plug usually contains the socket contacts and is mounted on the 'hot' (rack) side of the system. Plugs mate with receptacles, jacks, outlets, etc.",
    },
    {
      "id": 1,
      "word": "Plug Connector",
      "def":
          "An electrical connector that is intended to be attached to the free end of a conductor, wire, cable, or bundle, and that couples or mates to a receptacle connector.",
    },
    {
      "id": 1,
      "word": "PM",
      "def":
          "Phase Modulation - The modification of the phase of a higher frequency, constant magnitude carrier signal controlled by the amplitude and phase of a lower frequency baseband or audio signal.",
    },
    {
      "id": 1,
      "word": "PMOS",
      "def":
          "P-channel metal-oxide semiconductor. A MOS IC using p-type material for the channels.",
    },
    {
      "id": 1,
      "word": "PNP (p-n-p) Transistor",
      "def":
          "A bipolar transistor with a p-type emitter, n-type base and p-type collector.",
    },
    {
      "id": 1,
      "word": "pnp transistor",
      "def":
          "A bipolar transistor having an n-type base between a p-type emitter and a p-type collector. The emitter should be positive with respect to the base, and the collector should be negative with respect to the base.",
    },
    {
      "id": 1,
      "word": "Point Contact",
      "def":
          "The original 'microwave diode' made in the 1950's by Microwave Associates. Microwave Associates started a major new product program in August 1952 to manufacture microwave diodes. These diodes, now universally known as point contact diodes, were the first widely used high frequency semiconductors, and were used as mixer or detector diodes in all high frequency receivers (radars and radio links). Microwave Associates manufactured these by pressing a pointed tungsten wire whisker against a small silicon chip.",
    },
    {
      "id": 1,
      "word": "point-to-point connection",
      "def":
          "A network configuration in which a connection or transmission channel is established between two, and only two, circuits.",
    },
    {
      "id": 1,
      "word": "Poke Through",
      "def":
          "A term describing stray wires in a solder joint that poke through the insulation.",
    },
    {
      "id": 1,
      "word": "Polarity",
      "def":
          "Ability of a converter to produce an output that is positive or negative referenced to ground. Also see Floating Output.",
    },
    {
      "id": 1,
      "word": "polarization",
      "def":
          "That feature of a housing, shell, or insert that permits the mating of plug and receptacle in only one specified alignment. Under certain circumstances, polarization and keying may be combined in a connector design. Mechanical features on mating components to prevent incorrect mating.",
    },
    {
      "id": 1,
      "word": "polarizing pin",
      "def": "A device incorporated in a connector to accomplish polarization.",
    },
    {
      "id": 1,
      "word": "pole",
      "def":
          "Elements of a device that control one path of the circuit; an output terminal of a switching device (eg switch or relay); a combination of mating contacts - normally open, normally closed, or both.",
    },
    {
      "id": 1,
      "word": "poly",
      "def":
          "A prefix meaning many. Thus, polymer means many mers, signifying a repeated structural unit.",
    },
    {
      "id": 1,
      "word": "Polyamide",
      "def":
          "A polymer formed by the reaction of a diamine and a diacid. Nylons are commercial polyamides characterized by toughness, solvent resistance, and sharp melting point.",
    },
    {
      "id": 1,
      "word": "polybutadiene",
      "def":
          "A family of thermosetting molding compounds offering good physical properties, excellent electrical properties, and outstanding resistance to water and aqueous liquids.",
    },
    {
      "id": 1,
      "word": "polyethylene",
      "def":
          "A thermoplastic material composed of polymers of ethylene. A variety of types of polyethylene are used in wires and cables in very large amounts. Polyethylene has excellent electrical properties for wire and cable insulation plus superior abrasion and solvent resistance, moisture resistance, light weight, low brittle point, and durability.",
    },
    {
      "id": 1,
      "word": "polyimide",
      "def":
          "Available for wire insulation in both film form and as a magnet wire enamel. It is chemically inert and is radiation resistant.",
    },
    {
      "id": 1,
      "word": "polymer",
      "def":
          "A compound formed by polymerization which results in the chemical union of monomers or the continued reaction between lower molecular weight polymers.",
    },
    {
      "id": 1,
      "word": "polymerize",
      "def":
          "To unite chemically two or more monomers or polymers of the same kind to form a molecule with higher molecular weight.",
    },
    {
      "id": 1,
      "word": "Polyolefin",
      "def":
          "A family of polymers (such as polyethylene and polypropylene) made from olefin monomers.",
    },
    {
      "id": 1,
      "word": "polypropylene",
      "def":
          "A plastic similar to polyethylene but is lighter and offers even better heat resistance, tensile strength, abrasion resistance, and lower dielectric constant.",
    },
    {
      "id": 1,
      "word": "PolySwitch Resettable Devices",
      "def":
          "PolySwitch is a trademarked term that applies to our PTC resettable devices.",
    },
    {
      "id": 1,
      "word": "polyurethane",
      "def":
          "This material is primarily of interest as a magnet wire enamel for wires which can be soldered without prior removal of the film.",
    },
    {
      "id": 1,
      "word": "polyvinyl butyral",
      "def":
          "A thermoplastic material derived from butyraldehyde. Tough, colorless, flexible solid, used in laminates, adhesives, coatings, and crosslinked with ureas, phenolics, and other materials.",
    },
    {
      "id": 1,
      "word": "polyvinyl chloride",
      "def":
          "pvc - Thermoplastic compound composed of vinyl chloride polymers. Blended with other polymers or copolymerized with monomers to give abrasion resistance, heat stability, short molding cycles, and low shrinkage.",
    },
    {
      "id": 1,
      "word": "POP",
      "def": "point of presence",
    },
    {
      "id": 1,
      "word": "Port",
      "def":
          "A port is a connector that serves as an interface on a computer, motor, appliance, telephone, or other electrical device and serves as a connection point to another device or power source.",
    },
    {
      "id": 1,
      "word": "Positive feedback",
      "def":
          "Recycling of a signal that is in phase with the input to increase amplification. Used in digital circuits to standardize the wave forms in spite of any anomolies in the input.",
    },
    {
      "id": 1,
      "word": "positive lock",
      "def":
          "A type of latch or locking mechanism that engages in such a way that the parts cannot be unlocked accidentally. Used to hold die sets in tools, inserts in shells, connectors in mated position, contacts in certain pc board disconnects, etc.",
    },
    {
      "id": 1,
      "word": "positive logic",
      "def":
          "Digital logic is termed positive when logic 1 is assigned the more positive level (ie higher voltage level than logic 0). Logic 0 is assigned the lower (more negative) level.",
    },
    {
      "id": 1,
      "word": "Positive Temperature Coefficient",
      "def":
          "A term used to describe a material whose resistivity increases as temperature increases. PolySwitch devices make use of conductive polymers that show nonlinear PTC behavior.",
    },
    {
      "id": 1,
      "word": "Post Regulation",
      "def":
          "Output circuit that uses a linear regulator to prove line/load regulation and reduce ripple and noise. In PWM controlled converters, post regulation adds expense and degrades converter supply efficiency.",
    },
    {
      "id": 1,
      "word": "Post Tuning Drift",
      "def":
          "PTD - For a voltage controlled oscillator, it is the change in frequency of the oscillator after it has been driven to and attained a new frequency and after the tuning voltage has reached a stable state.",
    },
    {
      "id": 1,
      "word": "Postal, Telegraph and Telephone Company",
      "def":
          "PTT - Generic term for a provider of these services. A governmental agency in many countries.",
    },
    {
      "id": 1,
      "word": "Post-Reflow Resistance",
      "def":
          "The resistance of a PolySwitch device at room temperature one hour after it has been connected to a circuit board by reflow soldering under specified conditions.",
    },
    {
      "id": 1,
      "word": "Post-Reflow Resistance",
      "def":
          "The resistance of a PolySwitch device at room temperature one hour after it has been connected to a circuit board by reflow soldering under specified conditions.",
    },
    {
      "id": 1,
      "word": "Post-Trip Resistance",
      "def":
          "The resistance of a PolySwitch device at room temperature one hour after the device has been tripped for the first time, under specified conditions.",
    },
    {
      "id": 1,
      "word": "Post-Trip Resistance",
      "def":
          "The resistance of a PolySwitch device at room temperature one hour after the device has been tripped for the first time, under specified conditions.",
    },
    {
      "id": 1,
      "word": "pot",
      "def":
          "To embed a component in a material within a casing that becomes part of the product, primarily for protection.",
    },
    {
      "id": 1,
      "word": "potentiometer",
      "def":
          "(1) A precision instrument used for measuring dc potential (and thereby current or resistance). A null method is used so that no power is transferred to or from the unit under test. (2) A popular term for a variable resistor.",
    },
    {
      "id": 1,
      "word": "POTS",
      "def": "Plain Old Telephone Service",
    },
    {
      "id": 1,
      "word": "potting",
      "def":
          "The sealing of a component (eg, the cable end of a multiple-contact connector) with a plastic compound or material - to exclude moisture, prevent short circuits, provide strain relief, etc.",
    },
    {
      "id": 1,
      "word": "Powdered Iron Core",
      "def":
          "Powdered iron is a magnetic material that has an inherent distributed air gap. The distributed air gap allows the core to store higher levels of magnetic flux when compared to other magnetic materials such as ferrites. This characteristic allows a higher DC current level to flow through the inductor before the inductor saturates. Powdered iron cores are made of nearly 100% iron. The iron particles are insulated form each other, mixed with a binder (such as phenolic or epoxy) and pressed into the final core shape. The cores are cured via a baking process. Other characteristics of powerdered iron cores include: they are typically the lowest cost alternative and their permeabilities typically have a more stable temperature coefficient than ferrites (Also see Saturation Current)",
    },
    {
      "id": 1,
      "word": "Power",
      "def":
          "The rate of doing work. The unit of power is the watt, abbreviated as 'W' and equal to 1 joule per second (see 'joule').",
    },
    {
      "id": 1,
      "word": "Power Amplifier",
      "def":
          "PA - An amplifier intended to increase the power of a signal enough to drive a load such as an antenna. Typically, power amplifiers also have large values for P1dB, indicating low distortion at high output power.",
    },
    {
      "id": 1,
      "word": "Power Density",
      "def": "Ratio of converter output power to converter volume.",
    },
    {
      "id": 1,
      "word": "Power Dissipation",
      "def":
          "(1) The amount of electrical power converted to heat by a device. (2) The power (in watts) dissipated by a PolySwitch device in its tripped state. The power dissipation is the product of the current flowing through the device and the voltage across the device, in the tripped state.",
    },
    {
      "id": 1,
      "word": "Power Divider",
      "def":
          "A circuit that splits the power of an input signal into two or more locations without producing impedance mismatch.",
    },
    {
      "id": 1,
      "word": "Power Factor Correction",
      "def":
          "Design technique usually applied ot the input of off-line converters that improves the converter;s power factor and minimizes harmonics generated by the converter onto the AC power line.",
    },
    {
      "id": 1,
      "word": "Power Good",
      "def":
          "Signal (typically a visible LED) that indicates the DC output of the primary channel of a converter is still present.",
    },
    {
      "id": 1,
      "word": "Power Loss Density (mW/cm3)",
      "def":
          "The power absorbed by a body of ferromagnetic material and dissipated as heat.",
    },
    {
      "id": 1,
      "word": "Power Rating",
      "def": "Specified power available at the converter output pins.",
    },
    {
      "id": 1,
      "word": "Power sum",
      "def":
          "A mathematical addition of noise from multiple disturbers. Applied to NEXT and ELFEXT requirements.",
    },
    {
      "id": 1,
      "word": "Power Switch",
      "def":
          "MOSFET-based switch that controls the flow of power through its output using an enable (EN) signal from a system controller. Advanced designs will include integrated pull-up resistors and capacitors to minimize board space and cost.",
    },
    {
      "id": 1,
      "word": "Power Transformer",
      "def":
          "Magnetic-core transformer for operation at 60 hertz, with nearly zero source impedance, to transfer power from line voltage to some required voltage.",
    },
    {
      "id": 1,
      "word": "PPS",
      "def":
          "Precise Positioning Service (see also SPS). The GPS service provided for the US military usage.",
    },
    {
      "id": 1,
      "word": "PPTC Device",
      "def":
          "(Polymeric Positive Temperature Coefficient) Resettable device used to protect against overcurrent faults in electronic circuits.",
    },
    {
      "id": 1,
      "word": "PPTC Technology",
      "def":
          "PPTC stands for Positive Polymeric Temperature Coefficient. This is the technology that is used in our PolySwitch devices.",
    },
    {
      "id": 1,
      "word": "precision formed contact",
      "def":
          "A contact which is stamped from a flat sheet of metal and then formed through a progressive die.",
    },
    {
      "id": 1,
      "word": "Pre-etching",
      "def": "The act of surface preparation before encapsulating.",
    },
    {
      "id": 1,
      "word": "Preform",
      "def": "Usually, the solder ring in a SolderSleeve device.",
    },
    {
      "id": 1,
      "word": "pressure differential",
      "def":
          "The difference in pressure between one side of a connector and the other, as in a bulkhead mounting. Or the pressure difference between the inside and outside of a sealed connector.",
    },
    {
      "id": 1,
      "word": "Pretinned",
      "def":
          "Description of an electrical component to which solder has been applied prior to soldering.",
    },
    {
      "id": 1,
      "word": "Pretinned Solder Cup",
      "def":
          "Solder cup whose inner surfaces have been precoated with a small amount of solder.",
    },
    {
      "id": 1,
      "word": "Primary Circuits",
      "def": "Input side of an isolated.",
    },
    {
      "id": 1,
      "word": "Primary Current",
      "def":
          "Input side of an isolated DC-DC converter. See Secondary Circuit.",
    },
    {
      "id": 1,
      "word": "Primary Insulation",
      "def":
          "The inner member of a dual-wall wire insulation. The insulation applied directly on the conductor. Also referred to as the core. See also Core.",
    },
    {
      "id": 1,
      "word": "Primary Winding",
      "def":
          "The winding in a transformer that supplies the exciting MMF to the core.",
    },
    {
      "id": 1,
      "word": "printed circuit",
      "def":
          "A conductive pattern, that may or may not include printed components, formed in a predetermined design on the surface of an insulating base in an accurately repeatable manner. The two most common types of printed circuits are etched and plated.",
    },
    {
      "id": 1,
      "word": "printed circuit assembly",
      "def":
          "A printed circuit on which separately manufactured parts have been added (eg ceramic substrate with screened conductors, screened resistors, screened inductors, and separable miniaturized capacitors).",
    },
    {
      "id": 1,
      "word": "printed circuit board",
      "def":
          "PCB - An insulating board serving as a base for a printed circuit. When the printing process is completed, the board may include printed components, as well as printed wiring.",
    },
    {
      "id": 1,
      "word": "printed circuit edge connector",
      "def":
          "A connector designed specifically for making removable and reliable interconnections between the terminal area (edge pads) of a printed circuit board and the external wiring.",
    },
    {
      "id": 1,
      "word": "printed components",
      "def": "See printed element.",
    },
    {
      "id": 1,
      "word": "printed contact",
      "def":
          "The portion of a printed circuit pattern (path, land) extending to the edge of a printed circuit board to provide a contacting surface for some type of connector. Also referred to as terminal area and edge pad.",
    },
    {
      "id": 1,
      "word": "printed element",
      "def":
          "An element in printed form, such as a printed inductor, resistor, capacitor, or transmission line. Printed elements are formed on printed circuit boards along with connections. Also called printed components.",
    },
    {
      "id": 1,
      "word": "printed wiring",
      "def":
          "A type of printed circuit intended primarily to provide point-to-point electric connections and shielding.",
    },
    {
      "id": 1,
      "word": "printed wiring board",
      "def":
          "An insulating board serving as a base for printed wiring, completely processed as far as the printed portion is concerned, and consisting almost entirely of point-to-point connectors or posts, and shielding.",
    },
    {
      "id": 1,
      "word": "printing",
      "def":
          "The act or art of reproducing a pattern on a surface by any of various processes, such as vapor deposition, photo etching, embossing, diffusion, or screening.",
    },
    {
      "id": 1,
      "word": "PRN",
      "def": "Pseudo Random Noise",
    },
    {
      "id": 1,
      "word": "processor",
      "def":
          "That portion of a digital computer which performs the arithmetic, logic, and system control operations.",
    },
    {
      "id": 1,
      "word": "Production Control",
      "def":
          "PC - Group responsible for directing and regulating the movement of goods through the entire manufacturing cycle, from the requisitioning of raw materials to the delivery of the finished products.",
    },
    {
      "id": 1,
      "word": "production model",
      "def":
          "A model in its final mechanical and electrical design form, and manufactured using production tooling and methods.",
    },
    {
      "id": 1,
      "word": "program",
      "def":
          "The set of instructions that the computer is directed to carry out in a specified sequence. The program sets down the procedure the computer is to follow in solving the problem at hand. It is, basically, a large problem solving algorithm made up of many simpler algorithms that are within the 'scope' (instructions in memory) of the computer. In a larger sense, the program would include any other functions necessary to the integration of a computer in a system.",
    },
    {
      "id": 1,
      "word": "programmable memory",
      "def":
          "A memory whose locations are addressable by the computer's program counter, ie a program within this memory may directly control the operation of the arithmetic and control unit.",
    },
    {
      "id": 1,
      "word": "programming",
      "def":
          "Selection of the desired circuit pattern from the variety of circuit options afforded by a given device. AMP offers a number of programmable products, such as: pin boards, programming systems, matrix rotary switches, bcd rotary switches, slide switches, card readers, etc. In addition, programming is sometimes done by interconnecting (jumpering) appropriate contacts on one side of a panel or a connector plug.",
    },
    {
      "id": 1,
      "word": "programming system",
      "def":
          "The programming language, the computer program, and the computer's means (processor) of convertingthe language into absolute coding.",
    },
    {
      "id": 1,
      "word": "PROM",
      "def":
          "Programmable read only memory. A ROM that can be programmed by the user, but that cannot be reprogrammed.",
    },
    {
      "id": 1,
      "word": "propagation delay",
      "def":
          "Time required for an electronic digital device, or transmission network, to transfer information from its input to its output.",
    },
    {
      "id": 1,
      "word": "Propagation delay skew",
      "def":
          "The difference in propagation delay between the slowest and fastest pairs in a cable or system.",
    },
    {
      "id": 1,
      "word": "propagation delay time",
      "def":
          "The time between the application of a digital input waveform and the corresponding change in output waveform. It is measured between reference points on the waveforms. The time is generally different for positive-going and negative-going waveforms.",
    },
    {
      "id": 1,
      "word": "protocol",
      "def":
          "A formal set of conventions or rules governing the format, timing, and error control to facilitate message exchanges among electronic equipment.",
    },
    {
      "id": 1,
      "word": "prototype",
      "def":
          "A model suitable for use in complete evaluation of form, design, and performance.",
    },
    {
      "id": 1,
      "word": "PS ELFEXT",
      "def": "See power sum and ELFEXT.",
    },
    {
      "id": 1,
      "word": "PS NEXT",
      "def": "See power sum and NEXT.",
    },
    {
      "id": 1,
      "word": "psi",
      "def":
          "Pounds per square inch, normally used for measuring air pressure.",
    },
    {
      "id": 1,
      "word": "PTC",
      "def":
          "A term used to describe a material whose resistivity increases as temperature increases. PolySwitch devices make use of conductive polymers that show nonlinear PTC behavior.",
    },
    {
      "id": 1,
      "word": "PTD",
      "def":
          "Post Tuning Drift - - For a voltage controlled oscillator, it is the change in frequency of the oscillator after it has been driven to and attained a new frequency and after the tuning voltage has reached a stable state.",
    },
    {
      "id": 1,
      "word": "p-type",
      "def":
          "Semiconductor material that has been doped with an excess of acceptor impurity atoms that produce free holes in the material. Conduction mode is by holes.",
    },
    {
      "id": 1,
      "word": "p-type conductivity",
      "def":
          "The conductivity associated with holes in a semiconductor, which is equivalent to a positive charge.",
    },
    {
      "id": 1,
      "word": "P-type Material",
      "def":
          "A semiconductor material that has had acceptor atoms added, thereby imparting a net positive charge.",
    },
    {
      "id": 1,
      "word": "p-type semiconductor",
      "def":
          "An extrinsic semiconductor in which the hole density exceeds the conduction electron density, therefore the majority carriers are holes. The net ionized impurity concentration is acceptor type.",
    },
    {
      "id": 1,
      "word": "pull out",
      "def":
          "Force required to separate a cable from a connector by pulling them apart. See also contact retention.",
    },
    {
      "id": 1,
      "word": "pull strength",
      "def": "See bond strength.",
    },
    {
      "id": 1,
      "word": "pull test",
      "def":
          "The application of longitudinal stress for the purpose of testing. See also tensile strength.",
    },
    {
      "id": 1,
      "word": "pulse",
      "def":
          "A change in the level, over a relatively short period of time, of a signal whose value is normally constant. Example: The voltage level of a point shifts from 0 to +12 volts, with respect to ground, for a period of 2 microseconds. Pulses represent the 1's and 0's of digital logic.",
    },
    {
      "id": 1,
      "word": "pulse broadening",
      "def":
          "The spreading or lengthening of a light pulse due to modal or spectral dispersion.",
    },
    {
      "id": 1,
      "word": "Pulse spreading",
      "def":
          "The dispersion of an optical signal with time as it propagates through an optical fiber.",
    },
    {
      "id": 1,
      "word": "Pulse Transformers",
      "def":
          "Transformers designed for excitation that consists of short duration pulses repeated at a specific rate.",
    },
    {
      "id": 1,
      "word": "pulse width",
      "def":
          "The length of time that the pulse voltage is at the transient level. Electronic pulse widths normally are in the millisecond (10-3), microsecond (10-6), or nanosecond (10-9) range. See also pulse.",
    },
    {
      "id": 1,
      "word": "Pulse Width Modulation",
      "def":
          "(PWM) Circuit used in converters to regulate output voltage. Regulation is achived by varying the conduction time of the transistor switches.",
    },
    {
      "id": 1,
      "word": "Pulse-coded modulation",
      "def":
          "A technique in which an analog signal, such as a voice, is converted into a digital signal by sampling the signal's amplitude and expressing the different amplitudes as a binary number. The sampling rate must be twice the highest frequency in the signal.",
    },
    {
      "id": 1,
      "word": "pulseforming network",
      "def":
          "A device to store electricity and release it in pulses at specified time intervals (frequency).",
    },
    {
      "id": 1,
      "word": "Punchdown",
      "def": "Refers to IDC connectors and the method used to terminate them.",
    },
    {
      "id": 1,
      "word": "Pure Inductors",
      "def":
          "Used at all frequencies to provide an electronic circuit with inductive reactance.",
    },
    {
      "id": 1,
      "word": "purple plague",
      "def":
          "A gold-to-aluminum combination - at high temperatures - forms a gold-aluminum intermetallic compound. This compound, called purple plague because of its purple color, weakens the bond. On the chip, pads are normally aluminum and when the wire to be bonded is gold, this condition may occur. Plague can be prevented by avoiding processes involving high heat, or by using aluminum-to-aluminum (or even gold-to-gold) junctions.",
    },
    {
      "id": 1,
      "word": "Push-back",
      "def":
          "That property of a braid or shield that allows the braid or shield to be pushed back easily along the cable core.",
    },
    {
      "id": 1,
      "word": "Push-Pull",
      "def":
          "A switching power supply topology where power is delivered to the load during the whole input cycle. These can achieve power levels in excess of 1000VA. Push-pull transformers are practical at low input voltages and higher output power. They are not advisable for off line converters because the power switches operate at collector stress voltages of twice the supply voltage.",
    },
    {
      "id": 1,
      "word": "Push-Pull Converter",
      "def":
          "Converter topology usually configured as a forward converter, but uses two transistor switches and a center tapped transformer. The transistor switches turn on and off alternately. Also see Boost Regulator, Buck Regulator, Bridge Converter, Flyback Converter and Resonant Converter.",
    },
    {
      "id": 1,
      "word": "PVC",
      "def": "Polyvinyl chloride - A polymer compound used as wire insulation.",
    },
    {
      "id": 1,
      "word": "PVDF",
      "def": "Polyvinylidene fluoride.",
    },
    {
      "id": 1,
      "word": "pwb",
      "def":
          "An insulating board serving as a base for printed wiring, completely processed as far as the printed portion is concerned, and consisting almost entirely of point-to-point connectors or posts, and shielding.",
    },
    {
      "id": 1,
      "word": "Q",
      "def":
          "Q factor - (1) Quality factor: the ratio of energy stored to energy dissipated. A measure of the relative losses in an inductor. It is also known as the quality factor, defined as the ratio of inductive reactance to effective resistance. Q is zero at the SRF of an inductor. (2) Also the symbol for electrical charge. (3) An omnipotent being in the Star Trek universe.",
    },
    {
      "id": 1,
      "word": "Q Factor",
      "def":
          "Ratio of energy stored to energy dissipated. A measure of the relative losses in an inductor. It is also known as the quality factor, defined as the ratio of inductive reactance to effective resistance. Q is zero at the SRF of an inductor.",
    },
    {
      "id": 1,
      "word": "QAM",
      "def":
          "Quadrature Amplitude Modulation. A two-dimensional modulation used for ADSL, cable modems and proposed for VDSL. CAP is a special case of QAM. In QAM, a single carrier frequency is modulated in both sine and cosine components.",
    },
    {
      "id": 1,
      "word": "QPSK",
      "def": "Quadrature phase shift key modulation.",
    },
    {
      "id": 1,
      "word": "Quadrature",
      "def": "Orthogonal.",
    },
    {
      "id": 1,
      "word": "Quality Assurance",
      "def":
          "Systematic, planned, and documented activities designed to provide confidence that a product will meet specifications.",
    },
    {
      "id": 1,
      "word": "Quality Control",
      "def":
          "Activities that monitor, measure, and control the characteristics of a material, component, or product to documented specifications.",
    },
    {
      "id": 1,
      "word": "quantizer",
      "def":
          "An analog-to-digital converter. A device that measures the magnitude of a time varying quantity in multiples of some fixed unit or quantum, at a specified instant or specified repetition rate, and delivers a proportional response that is usually in pulse code or digital form. The amplitude of the response signal is at each instant proportional to the number of quanta measured.",
    },
    {
      "id": 1,
      "word": "Quantum efficiency",
      "def":
          "In a photodiode, the ratio of primary carriers (electron-hole pairs) created to incident photons. A quantum efficiency of 70% means 7 out of 10 incident photons create a carrier.",
    },
    {
      "id": 1,
      "word": "queue",
      "def":
          "Waiting lines resulting from temporary delays in providing service.",
    },
    {
      "id": 1,
      "word": "Quick Disconnect",
      "def":
          "A type of connector shell that permits rapid locking and unlocking of two connector halves.",
    },
    {
      "id": 1,
      "word": "Quiescent operating point",
      "def":
          "The dc voltages, currents, and dissipation associated with a circuit while it is not being subjected to an input signal.",
    },
    {
      "id": 1,
      "word": "QUIP",
      "def":
          "QUad In-line Package. A packaging technique similar to a DIP but having two rows of pins along each long side, or a total of four rows.",
    },
    {
      "id": 1,
      "word": "R",
      "def": "Symbol used to denote resistance in ohms.",
    },
    {
      "id": 1,
      "word": "R1max",
      "def":
          "The maximum resistance of a PolySwitch device at room temperature one hour after being tripped or after reflow soldering.",
    },
    {
      "id": 1,
      "word": "RA Flux",
      "def": "Rosin-activated flux.",
    },
    {
      "id": 1,
      "word": "Ra max",
      "def":
          "Maximum functional resistance of device before and after defined stress tests.",
    },
    {
      "id": 1,
      "word": "Ra min",
      "def":
          "Minimum functional resistance of device before and after defined stress tests.",
    },
    {
      "id": 1,
      "word": "rack",
      "def":
          "A cabinet used to house components, which permits convenient removal of portions of the equipment for repair or examination. Original racks were standardized steel frames for 19-in. relay panels in telephone exchanges. Today, racks vary in size and shape to meet the specialized requirements of aircraft, computer, military electronics, and test equipment manufacturers. Racks accept equipment packages sometimes referred to as 'bins,' 'modules,' and 'black boxes.'",
    },
    {
      "id": 1,
      "word": "rack and panel connector",
      "def":
          "Mating connectors of which one - usually the plug - is mounted inside a cabinet (rack). The receptacle is attached to the back of a sliding drawer, and mates with the plug when the drawer is fully inserted.",
    },
    {
      "id": 1,
      "word": "Radiated Frequency",
      "def":
          "The frequency of a signal that is transmitted by a radio, radar, navigational aid, or other radio frequency equipment. Radiated frequency is abbreviated as 'RF.'",
    },
    {
      "id": 1,
      "word": "Radiation Crosslinking",
      "def":
          "The act of crosslinking a material with ionizing radiation. (Most Raychem products are radiation crosslinked, with an electron beam as the form of ionizing radiation.) See also Crosslinking by Irradiation.",
    },
    {
      "id": 1,
      "word": "Radio",
      "def":
          "A collection of circuits that converts electromagnetic energy gathered from free space to electrical or sound energy, vice versa or both.",
    },
    {
      "id": 1,
      "word": "Radio Frequency",
      "def":
          "Any electromagnetic frequency from a few hertz up to frequencies in the infrared portion of the spectrum, to approximately 300 THz (terahertz).",
    },
    {
      "id": 1,
      "word": "RADSL",
      "def":
          "Rate-Adaptive Digital Subscriber Line. A simple extension of ADSL to encompass a wide variety of data rates depending on the line's transmission capability. RADSL can either CAP or DMT ADSL.",
    },
    {
      "id": 1,
      "word": "RAIM",
      "def": "Receiver Autonomous Integrity Monitoring",
    },
    {
      "id": 1,
      "word": "RAM",
      "def":
          "(random access memory). A storage arrangement from which information can be retrieved with a speed independent of its location in the storage. A core memory is a RAM, a magnetic tape memory is not. RAMs have read and write capabilities.",
    },
    {
      "id": 1,
      "word": "random-access memory",
      "def":
          "(RAM) A storage arrangement from which information can be retrieved with a speed independent of its location in the storage. A core memory is a RAM, a magnetic tape memory is not. RAMs have read and write capabilities.",
    },
    {
      "id": 1,
      "word": "Rated Current",
      "def":
          "The level of continuous DC current that can be passed through the inductor. This DC current level is based on a maximum temperature rise of the inductor at the maximum rated ambient temperature. The rated current is related to the inductor's ability to minimize the power losses in the winding by having a low DC resistance. It is also related to the inductor's ability to dissipate this power loss in the windings. Thus, the rated current can be increased by reducing the DC resistance or increasing the inductor size. For low frequency current waveforms the RMS current can be substituted for the DC rated current. The rated current is not related to the magnetic properties of the inductor (Also see Incremental Current and Saturation Current)",
    },
    {
      "id": 1,
      "word": "Rated Temperature",
      "def":
          "The maximum temperature at which a component can operate for extended periods with acceptable changes in its basic properties.",
    },
    {
      "id": 1,
      "word": "Rated Voltage",
      "def":
          "The maximum voltage at which an electric component can operate for extended periods without undue degradation.",
    },
    {
      "id": 1,
      "word": "Ratio",
      "def":
          "The division of one quantity by another, thereby indicating their relative magnitudes and phase.",
    },
    {
      "id": 1,
      "word": "raw data",
      "def":
          "Data which has not been processed; may or may not be in machine-compatible form.",
    },
    {
      "id": 1,
      "word": "Raychem Product Number",
      "def":
          "RPN - A 10-digit number (such as 123456-4-001) assigned to every standard product and every product manufactured on a special manufacturing order (SMO). The first 6 digits represent the PCN (Product Control Number), followed by a 1-digit MOD Code, and finally a 3-digit suffix. See also MOD Code and SMO.",
    },
    {
      "id": 1,
      "word": "Rayleigh scattering",
      "def":
          "The scattering of light that results from small inhomogenei-ties in material density or composition.",
    },
    {
      "id": 1,
      "word": "RC filter",
      "def": "A filter made of resistor and capacitor",
    },
    {
      "id": 1,
      "word": "RC, RC circuit",
      "def": "Designation for any resistor-capacitor circuit.",
    },
    {
      "id": 1,
      "word": "Reactance",
      "def":
          "Frequency-dependent impedance that is capable of storing but not dissipating energy. Reactance can be capacitive or inductive.",
    },
    {
      "id": 1,
      "word": "read",
      "def":
          "To copy, usually from one form of storage to another, particularly from external or secondary storage to internal storage; to sense the meaning of arrangements of hardware; to sense the presence of information on a storage medium.",
    },
    {
      "id": 1,
      "word": "read out",
      "def":
          "(1) A term used with pc boards and pc connectors, meaning the ability to make contact with certain circuits. Example: A dual read out pc connector will permit two wires to be connected to any one circuit on the pc board. (2) The display of data as an output of a computing, storing, or decoding device.",
    },
    {
      "id": 1,
      "word": "read-only memory",
      "def": "ROM - A storage arrangement primarily for information retrieval.",
    },
    {
      "id": 1,
      "word": "real-time operation",
      "def":
          "Solving problems as fast as they occur so that the results can be used to guide the operation.",
    },
    {
      "id": 1,
      "word": "Rear Release Contacts",
      "def":
          "Connector contacts designed to be released and removed from the rear (wire side) of the connector. The removal tool engages the contact from the rear and pulls the contact out of the connector contact retainer.",
    },
    {
      "id": 1,
      "word": "Receiver Protector",
      "def":
          "A circuit or device that prevents incident high power, potentially-damaging signals from propagating to sensitive receiver components.",
    },
    {
      "id": 1,
      "word": "Receiver Sensitivity",
      "def":
          "The minimum received signal power level for which a receiver can produce a discernible output signal. The following equation for the sensitivity of a receiver shows the parameters that affect a receiving system's sensitivity",
    },
    {
      "id": 1,
      "word": "Receptacle",
      "def":
          "Usually the fixed or stationary half of a two-piece multiple contact connector. Also the connector half usually mounted on a panel and containing socket contacts. In coaxial rf connectors the receptacle is usually the fixed or stationary one that is mounted on a panel. In shell type multiple-contact connectors the receptacle usually contains the pin contacts and is mounted on the 'cold' side of the circuit such as in a drawer or 'black box.' Receptacles mate with plugs.",
    },
    {
      "id": 1,
      "word": "record",
      "def": "A line of information under a collection of fields.",
    },
    {
      "id": 1,
      "word": "Recover (Heat-shrinkable Components)",
      "def":
          "Activation of the elastic memory principle (usually with heat) to cause a tubing or molded part to return to its original size.",
    },
    {
      "id": 1,
      "word": "Recovered ID",
      "def":
          "RID - In heat-shrink tubing, the guaranteed maximum internal diameter of tubing after being freely recovered.",
    },
    {
      "id": 1,
      "word": "Recovery Temperature",
      "def":
          "The minimum temperature required to fully shrink a product, that is, for the product to recover completely.",
    },
    {
      "id": 1,
      "word": "Recovery Time",
      "def":
          "The time interval required, after a sudden decrease in input signal amplitude to a system or transducer, to attain a stated percentage (usually 63 percent) of the ultimate change in amplification or attenuation due to this decrease.",
    },
    {
      "id": 1,
      "word": "rectification",
      "def":
          "The process of converting alternating current into a unidirectional current, by removing or inverting that part of the wave laying on one side of the zero amplitude axis. There are two general types of retificitaion processes, half-wave and full-wave.",
    },
    {
      "id": 1,
      "word": "Rectifier",
      "def":
          "Device that allows current to flow in only one direction, such as a diode.",
    },
    {
      "id": 1,
      "word": "redundancy",
      "def":
          "Any deliberate duplication, or partial duplication, of circuitry or information to decrease the probability of a system or communication failure.",
    },
    {
      "id": 1,
      "word": "Reduntant Operation",
      "def":
          "Parallel configuration of converters used in distributed power system to increase system reliabiltiy. Converters may be used in a 'N+1' architucture.",
    },
    {
      "id": 1,
      "word": "reflection",
      "def":
          "The backward transmission of electrical energy caused by a change in impedance.",
    },
    {
      "id": 1,
      "word": "Reflection Coefficient",
      "def":
          "At a specified plane in a uniform transmission line, the vector ratio of the reflected to the incident waves. The symbol for reflection coefficient is 'G'.",
    },
    {
      "id": 1,
      "word": "reflection coefficient",
      "def":
          "The fraction of light power reflected backward at the fiber end face. This accounts for about a .2 to .3 dB loss, typically.",
    },
    {
      "id": 1,
      "word": "Reflection Loss",
      "def":
          "The part of transmission loss due to power reflected by a discontinuity (impedance mismatch) in a transmission line.",
    },
    {
      "id": 1,
      "word": "reflective codes",
      "def":
          "Codes which appear to be the mirror image of normal counting codes.",
    },
    {
      "id": 1,
      "word": "refractive index",
      "def":
          "(n) The ratio of the speed of light in a vacuum (c) to the speed of light in an alternate medium(v). n=c/v",
    },
    {
      "id": 1,
      "word": "Regenerative repeater",
      "def":
          "A repeater designed for digital transmission that bothamplifies and reshapes the signal.",
    },
    {
      "id": 1,
      "word": "Regional Bell Operating Companies",
      "def":
          "RBOC - Seven LEC telephone companies created after AT&amp;T divestiture.",
    },
    {
      "id": 1,
      "word": "register",
      "def":
          "A memory device capable of containing one or more computer bits or words.",
    },
    {
      "id": 1,
      "word": "register mark",
      "def":
          "A mark used to establish the relative position of one or more printed wiring patterns, or portions thereof, with respect to their desired locations on one or both sides of a printed wiring base.",
    },
    {
      "id": 1,
      "word": "Regulation",
      "def":
          "Ability of a converter to maintain an output voltge to within specified limits under varying conditions of input line and output load. Also see Linear Regulation.",
    },
    {
      "id": 1,
      "word": "relay",
      "def":
          "An electrical device that is designed to interpret input conditions in a prescribed manner, and - when specified conditions are met - to respond by causing contacts to operate, or similar abrupt changes in associated electric control circuits. Inputs are normally electric, but may be thermal, mechanical, or other qualities. Limit switches and other such simple devices are not to be considered as relays. A relay is an electrically operated switch.",
    },
    {
      "id": 1,
      "word": "relay contact bounce",
      "def":
          "Undesired intermittent closure of open contacts or opening of closed contacts. This may occur either when the relay is operated or released, or when the relay is subjected to external shock or vibration. The term 'bounce' is normally associated with internal causes.",
    },
    {
      "id": 1,
      "word": "Reliability",
      "def":
          "The probability that a device, component or system will perform adequately for the expected time under given conditions.",
    },
    {
      "id": 1,
      "word": "Remote LAN Access",
      "def":
          "A data communications such as a corporate or campus environment in which the computer networks can be accessed remotely via public telecommunications networks.",
    },
    {
      "id": 1,
      "word": "Remote Sensing",
      "def":
          "Using sense leads connected at the output load provides feedback to voltage regulation circuits of a converter. This arrangement is used to compenate for voltage losses from long leads to a load. Also see Local Sensing.",
    },
    {
      "id": 1,
      "word": "Remote Shutdown",
      "def": "See Logic Inhibit/Enable.",
    },
    {
      "id": 1,
      "word": "Removable Contact",
      "def":
          "A contact that can be mechanically joined to or removed from an insert. Usually special tools are required to lock the contact in place or remove it for repair or replacement.",
    },
    {
      "id": 1,
      "word": "Repeater",
      "def":
          "A device that receives, amplifies (and perhaps reshapes), and retransmits a signal. It is used to boost signal levels when the distance between repeaters is so great that the received signal would otherwise be too attenuated to be properly received.",
    },
    {
      "id": 1,
      "word": "Repetition Rate",
      "def": "The number of occurrences of an event per unit time.",
    },
    {
      "id": 1,
      "word": "reset",
      "def":
          "The operation of returning an electronic, or electrical, device to its original or 'start' point. Most AMP data terminals offer manual reset, automatic reset, or both.",
    },
    {
      "id": 1,
      "word": "Residual Flux",
      "def":
          "The flux that remains in a core when the applied MMF is returned to zero.",
    },
    {
      "id": 1,
      "word": "Residual FM",
      "def":
          "Undesirable, apparent frequency modulation of a signal source caused by noise or spurious signals.",
    },
    {
      "id": 1,
      "word": "residual forces",
      "def":
          "The elastic forces which remain after each contact member has been deformed or deflected to its final state.",
    },
    {
      "id": 1,
      "word": "resiliency",
      "def":
          "That property of a strained body which enables it to recover its size and shape as it is unloaded after some initial deformation.",
    },
    {
      "id": 1,
      "word": "resist",
      "def":
          "A material such as ink, paint, metallic plating, etc used to protect the desired portions of the conductive pattern from the action of the etchant, solder, or plating.",
    },
    {
      "id": 1,
      "word": "Resistance",
      "def":
          "(1) The frequency-invariant opposition to current flow, abbreviated as 'R.' The unit of resistance is the ohm (?). (2) The resistance of a PolySwitch device under specified conditions (e.g., 20?C), before connection into a circuit. Devices of a particular type will be delivered with a range of resistances; therefore, a minimum value, Rmin, and/or a maximum value, Rmax, are often given.",
    },
    {
      "id": 1,
      "word": "Resistance bias",
      "def":
          "A situation where the positive and negative leads of a DC power supply (or hot and neutral leads for an AC power supply) are erroneously reversed and would cause current to flow in the wrong direction.",
    },
    {
      "id": 1,
      "word": "Resistance Binned Devices",
      "def":
          "Resistance binned devices are supplied such that all parts in one package are within 0.5 ? of each other. Individual binned packages are supplied from the full resistance limits of the specified product.",
    },
    {
      "id": 1,
      "word": "Resistance Sorted Devices",
      "def":
          "Resistance sorted devices (part number suffix 'Rx') are supplied with resistance values that are within specified limits of the product's full range of resistance.",
    },
    {
      "id": 1,
      "word": "resistor",
      "def":
          "A circuit component which offers resistance to the flow of electric current. Its electrical size is specified in ohms or megohms (1 megohm = 1,000,000 ohms). A resistor also has a powerhandling rating measured in watts, which indicates the amount of power which can safely be dissipated as heat by the resistor.",
    },
    {
      "id": 1,
      "word": "resonance",
      "def":
          "The frequency at which capacitive reactance and inductive reactance are equal and therefore cancel one another's effects.",
    },
    {
      "id": 1,
      "word": "Resonant Converter",
      "def":
          "Switching converter technology in which a resonant tank circuit operating at very high frequencies is used to transfer energy to the output.",
    },
    {
      "id": 1,
      "word": "Resonant Frequency",
      "def":
          "The frequency at which the inductive and capacitive reactances of a circuit are equal in magnitude, thereby canceling each other's effects. The symbol for resonant frequency is 'fR.'",
    },
    {
      "id": 1,
      "word": "Responsivity",
      "def":
          "The ratio of a photodetector I s electrical output to its optical input in amperes/watt.",
    },
    {
      "id": 1,
      "word": "restricted entry",
      "def":
          "A design feature incorporated in a female contact to prevent the entry of an oversize pin or test probe.",
    },
    {
      "id": 1,
      "word": "retaining ring",
      "def":
          "A small circular steel ring, often resembling the letter 'C,' that is usually inserted into a slot in a pivot pin to hold the pin in a specified position.",
    },
    {
      "id": 1,
      "word": "retaining spring",
      "def":
          "Used to balance contact pressure and increase board retention when a single-sided pc board is used in a connector designed for two-sided boards. A limited number of springs are used to replace the contacts in the unused side of the connector.",
    },
    {
      "id": 1,
      "word": "RETMA",
      "def":
          "Abbreviation for Radio-Electronics-Television Manufacturers' Association. Now changed to Electronics Industries Association (EIA).",
    },
    {
      "id": 1,
      "word": "Return",
      "def":
          "Common terminal on the output of a DC-DC converter. It is the return current path for the output. Also see Common.",
    },
    {
      "id": 1,
      "word": "Return loss",
      "def":
          "A measure of the signal reflected back toward the transmitter as a result of impedance variations in the cabling system.",
    },
    {
      "id": 1,
      "word": "Return reflection",
      "def":
          "Reflected optical energy that propagates backward to the source in an optical fiber.",
    },
    {
      "id": 1,
      "word": "Return reflection loss",
      "def":
          "The attenuation of reflected light; high return loss is desirable, especially in single-mode fibers.",
    },
    {
      "id": 1,
      "word": "Reverse Current",
      "def":
          "Current flowing from input to output or input to case of an isolated converter at a specified voltage level.",
    },
    {
      "id": 1,
      "word": "Reverse Voltage Protection",
      "def":
          "Converter feature that prevents damage to internal components if a reverse voltage is inadvertently applied to the input or ouput terminals.",
    },
    {
      "id": 1,
      "word": "Reversible Temperature Coefficient",
      "def":
          "Changes in flux which occurs with temperature change. They are spontaneously regained when the temperature is returned to its original point. There are two values reported: reversible temperature coefficients of inductance (Br) and Coercivity (Hci). The temperature range over which they have been measured and specified should be stated. Most materials exhibit a non-linear response with temperature.",
    },
    {
      "id": 1,
      "word": "Rex Univariable Whisker Press",
      "def":
          "A machine invented at Microwave Associates (predecessor of M/A-COM) to form and manufacture the precise, sharply pointed whiskers that were required for point contact diodes.",
    },
    {
      "id": 1,
      "word": "RF",
      "def":
          "Radiated Frequency. Also used as an abbreviation for Radio Frequency, used as a noun or adjective.",
    },
    {
      "id": 1,
      "word": "RF Frequency",
      "def":
          "The frequency in the portion of the electromagnetic spectrum that is loosely considered to be between above the audio-frequency portion and the infrared portion. It is normally 20 kHz to hundreds of GHz.",
    },
    {
      "id": 1,
      "word": "RF Impedance",
      "def": "The impedance of a circuit or component at high frequencies.",
    },
    {
      "id": 1,
      "word": "RFI",
      "def":
          "RFI is an acronym for Radio-Frequency Interference. It is an older and more restrictive term that is used interchangeably with EMI (Also see EMI.)",
    },
    {
      "id": 1,
      "word": "RFP",
      "def": "request for proposal",
    },
    {
      "id": 1,
      "word": "RG/U",
      "def":
          "RG/U is used to designate coaxial cables that are made to a Government specification. In the case of RG58/U, the 'R' means RADIO FREQUENCY, the 'G' means GOVERNMENT, the 58 is the number assigned to Government approval, and the 'U' means it's a UNIVERSAL specification.",
    },
    {
      "id": 1,
      "word": "rib",
      "def":
          "Configuration designed into a plastic part to provide lateral, horizontal, or other structural support.",
    },
    {
      "id": 1,
      "word": "Ribbon Cable",
      "def":
          "Flat cable with conductors that have been individually insulated together. Its structure is usually characterized by individual colors of insulation for each conductor, although a single color may be used for all conductors.",
    },
    {
      "id": 1,
      "word": "ribbon cable",
      "def":
          "Round conductor flat cable. A form of flexible flat cable (ffc) consisting of parallel round conductors in a flexible insulating material and designed for mass termination.",
    },
    {
      "id": 1,
      "word": "RID",
      "def": "Recovered Inside Diameter",
    },
    {
      "id": 1,
      "word": "right-angle edge connector",
      "def":
          "The plug is mounted to a chassis or back panel, and the receptacle is mounted along an edge of - and soldered to - the circuits of a printed circuit board. Pins of the receptacle are generally simple rod stock bent at right angles and molded into the receptacle insert. The board and receptacle assembly is mated with the plug to complete circuit wiring.",
    },
    {
      "id": 1,
      "word": "ring counter",
      "def":
          "A loop or ring of 'counter' stages, so interconnected that only one stage is 'on' at any given time. An input trigger pulse causes the 'on' state to move to the adjacent stage. Thus, the 'on' state moves around the loop.",
    },
    {
      "id": 1,
      "word": "Ring network",
      "def":
          "A network topology in which terminals are connected in a point-to-point serial fashion in an unbroken circular configuration.",
    },
    {
      "id": 1,
      "word": "Ripple",
      "def": "Variation in magnitude",
    },
    {
      "id": 1,
      "word": "Ripple and Noise",
      "def":
          "Periodic and Random Deviation - Noise and ripple voltage superimposed on a converter's DC output. Typically specified at full load, it is expressed in peak-to-peak or RMS volts over a given bandwidth.",
    },
    {
      "id": 1,
      "word": "Ripple Voltage",
      "def":
          "The periodic alternating voltage imposed on the voltage output of a switching voltage converter. The ripple voltage is normally specified as a peak-to-peak value.",
    },
    {
      "id": 1,
      "word": "rise time",
      "def":
          "The time required for a component, or logic circuit, to change from the quiescent to the transient state, when an input is applied (ie elapsed time between application of input and attainment of full output level).",
    },
    {
      "id": 1,
      "word": "Riser",
      "def":
          "Backbone cabling connecting telecom closets situated vertically on separate floors.",
    },
    {
      "id": 1,
      "word": "RJ11",
      "def":
          "A wiring pattern for 6-position modular jacks.Used to refer to the jacks themselves.",
    },
    {
      "id": 1,
      "word": "RJ21",
      "def":
          "A wiring pattern for a 25-pair (AMP CHAMP) connector.Also used to refer to the connectors themselves.",
    },
    {
      "id": 1,
      "word": "RJ45",
      "def":
          "A wiring pattern for8-position modular jacks.Used to refer to the jacks themselves.",
    },
    {
      "id": 1,
      "word": "RMA Flux",
      "def": "Rosin-mildly-activated flux.",
    },
    {
      "id": 1,
      "word": "Rmax",
      "def":
          "The resistance of a PolySwitch device under specified conditions (e.g., 20?C), before connection into a circuit. Devices of a particular type will be delivered with a range of resistances; therefore, a minimum value, Rmin, and/or a maximum value, Rmax, are often given.",
    },
    {
      "id": 1,
      "word": "RMC",
      "def": "An NMEA message",
    },
    {
      "id": 1,
      "word": "Rmin",
      "def":
          "The resistance of a PolySwitch device under specified conditions (e.g., 20?C), before connection into a circuit. Devices of a particular type will be delivered with a range of resistances; therefore, a minimum value, Rmin, and/or a maximum value, Rmax, are often given.",
    },
    {
      "id": 1,
      "word": "rms",
      "def":
          "Root Mean Square - The effective value of an alternating current, corresponding to the direct current value that will produce the same heating effect.",
    },
    {
      "id": 1,
      "word": "robotics",
      "def":
          "The theory and application of robots, a completely self-contained electronic, electric, or mechanical device, to such activities as manufacturing.",
    },
    {
      "id": 1,
      "word": "roentgen",
      "def":
          "The amount of radiation that will produce one electrostatic unit of ions per cubic centimeter volume.",
    },
    {
      "id": 1,
      "word": "ROM",
      "def":
          "Read-only memory. A memory, usually a semiconductor chip, in which the information is permanently stored. ROMs offer random-access read capabilities. May be programmed during manufacture or by the user. Some are reprogrammable. See PROM and EPROM.",
    },
    {
      "id": 1,
      "word": "root mean square",
      "def":
          "RMS - The effective value of an alternating current, corresponding to the direct current value that will produce the same heating effect.",
    },
    {
      "id": 1,
      "word": "Rope Lay",
      "def":
          "A type of conductor lay that uses stranded conductors as components to build a larger conductor.",
    },
    {
      "id": 1,
      "word": "rotary switch",
      "def":
          "A multiposition switch operated by rotating a control knob (attached to its shaft) either clockwise, counterclockwise, or both.",
    },
    {
      "id": 1,
      "word": "rotor",
      "def":
          "The rotating member of a motor that includes a shaft. Commonly called the armature.",
    },
    {
      "id": 1,
      "word": "routine",
      "def":
          "A series of computer instructions for performing a specific, limited task.",
    },
    {
      "id": 1,
      "word": "Royer Converter",
      "def":
          "Self-oscillating, push-pull switching circuit configuration commonly used in low cost, low power DC-DC converters. Also called the classical converter.",
    },
    {
      "id": 1,
      "word": "RPN",
      "def":
          "Raychem Product Number - A 10-digit number (such as 123456-4-001) assigned to every standard product and every product manufactured on a special manufacturing order (SMO). The first 6 digits represent the PCN (Product Control Number), followed by a 1-digit MOD Code, and finally a 3-digit suffix. See also MOD Code and SMO.",
    },
    {
      "id": 1,
      "word": "RS 232, 422, 449+A2043",
      "def":
          "A series of standards defining the physical link between units of data communication equipment.",
    },
    {
      "id": 1,
      "word": "RT and RW specifications",
      "def":
          "Specification that describes standard product properties. Qualification and acceptance inspection criteria are incorporated into RT and RW specifications. RT and RW specifications are issued and controlled by the Specifications Group.",
    },
    {
      "id": 1,
      "word": "RTCA",
      "def":
          "Radio Technical Commission for Aeronautics (For WAAS &amp; EGNOS services)",
    },
    {
      "id": 1,
      "word": "RTCM",
      "def":
          "Radio Technical Commission For Maritime Services (Special Committee 104 - A committee created for the purposes of establishing standards and guidance for interfacing between radio beacon-based data links and GPS receivers, and to provide standards for ground-based differential GPS stations. )",
    },
    {
      "id": 1,
      "word": "RTK",
      "def": "Realtime Kinematic",
    },
    {
      "id": 1,
      "word": "rubber",
      "def":
          "An elastomer capable of rapid elastic recovery. Specifically, natural rubber, the standard of comparison for elastomers.",
    },
    {
      "id": 1,
      "word": "RZ data rates",
      "def":
          "Return to zero. A data transmission format in which the circuit must switch from 0 to 1 and back to 0 in a single clock pulse each time a logical 1 is presented. RZ rates are generally half those of NRZ rates. See also NRZ data rates.",
    },
    {
      "id": 1,
      "word": "SA",
      "def": "Selective Access or Selective Availability",
    },
    {
      "id": 1,
      "word": "safetying",
      "def":
          "A term used to cover the use of product features designed to prevent the loosening of hardware, or other mating elements, under conditions of shock and vibration. Elements drilled for safety wiring would be an example of this type of feature.",
    },
    {
      "id": 1,
      "word": "Saturable Reactor",
      "def":
          "Describes the main element of a magnetic amplifier used to control electrical power such as for electrical resistance element heating of furnaces.",
    },
    {
      "id": 1,
      "word": "Saturated",
      "def":
          "The state of operation of a device or circuit in which there is no increase in output for an increase in input",
    },
    {
      "id": 1,
      "word": "saturation",
      "def":
          "The condition in which a further increase in one variable produces no further increase in the resultant effect. The condition occurring when a transistor is driven so hard that it becomes biased in the forward direction. In a switching application, under saturation conditions the charge stored in the base region prevents the transistor from turning off quickly.",
    },
    {
      "id": 1,
      "word": "Saturation",
      "def":
          "Exists when an increase in magnetizing force (H) does not cause a corresponding increase in the flux density (B) of the material. The cause of saturation is relative to the magnetic properties of the core. Each material can store only a given amount of magnetic flux density. Beyond this the permeability of the core is reduced dramatically causing inductance to fall.",
    },
    {
      "id": 1,
      "word": "Saturation Current",
      "def":
          "The DC bias current flowing through tile inductor which causes the inductance to drop by a specified amount form the initial zero DC bias inductance value. Common specified inductance drop percentages include 1-% and 20%. IT is useful to use the 10% inductance drop value for ferrite cores and 20% for powdered iron cores in energy storage applications. The cause of the inductance to drop due to the DC bias current is related to the magnetic properties of the core. The core, and some of the space around the core, can only store a given amount of magnetic ~ density. Beyond the maximum flux density point, the permeabilty of the core is reduced. Thus, the inductance is caused to drop. Core saturation does not apply to air-core inductors (Also see Incremental Current and Permeability)",
    },
    {
      "id": 1,
      "word": "Saturation Flux Density",
      "def": "The flux density value at which a given material saturates.",
    },
    {
      "id": 1,
      "word": "SAW",
      "def":
          "Surface acoustic wave. Often short for surface acoustic wave filter.",
    },
    {
      "id": 1,
      "word": "S-band",
      "def": "The frequency interval from 2 to 4 GHz.",
    },
    {
      "id": 1,
      "word": "SC connector",
      "def":
          "A duplex optical fiber connector. The standard connector for optical fiber per the 568 cabling standard.",
    },
    {
      "id": 1,
      "word": "Scalar",
      "def": "Of or pertaining to magnitude but not phase.",
    },
    {
      "id": 1,
      "word": "scale factor",
      "def":
          "One or more coefficients used to multiply or divide quantities in a problem in order to convert them to a given magnitude (eg plus one to minus one).",
    },
    {
      "id": 1,
      "word": "scanner",
      "def":
          "An electromechanical or electronic device, normally cyclic in nature with N number of steps - starting at a predetermined point and returning to that same point. The word scanner is sometimes used interchangeably with multiplexer.",
    },
    {
      "id": 1,
      "word": "SCD",
      "def":
          "Specification Control Drawing - Drawing that defines configuration and material parameters. Issued and controlled by the specifications group, SCDs are frequently used in conjunction with RT Specifications for Thermofit products.",
    },
    {
      "id": 1,
      "word": "schematic",
      "def":
          "A 'scheme' for presenting information. Thus, a circuit schematic - in diagrammatic form - indicates the components, wiring, and connections of the circuit.",
    },
    {
      "id": 1,
      "word": "Schmitt trigger",
      "def":
          "A bistable trigger circuit that converts an input signal into a square-wave output signal by switching action, triggered at a predetermined point in each positive and negative swing of the input signal.",
    },
    {
      "id": 1,
      "word": "Schottky",
      "def":
          "A metal-semiconductor junction that has a nonlinear voltage versus current characteristic.",
    },
    {
      "id": 1,
      "word": "Schottky TTL",
      "def":
          "A type of TTL notable for faster operating speeds than standard TTL.",
    },
    {
      "id": 1,
      "word": "Scoop-proof",
      "def":
          "A feature that prevents the damage of contacts during misaligned mating.",
    },
    {
      "id": 1,
      "word": "scratch pad memory",
      "def":
          "A computer information store that interfaces directly with the central processor. It is optimized for speed and has a limited capacity. Its purpose is to supply the central processor with the data for the immediate computation without the delays that would be encountered by interfacing with the main memory.",
    },
    {
      "id": 1,
      "word": "screw-machine contact",
      "def": "A contact which is machined from solid bar stock.",
    },
    {
      "id": 1,
      "word": "scribing",
      "def":
          "The scratching of a brittle substrate, such as alumina or silicon, to ensure cleavage along the scratch line. Wafers are scribed and then broken to produce integrated circuit chips.",
    },
    {
      "id": 1,
      "word": "SD",
      "def": "Secure Digital (Flash memory)",
    },
    {
      "id": 1,
      "word": "SDH",
      "def": "synchronous digital hierarchy",
    },
    {
      "id": 1,
      "word": "SDLC",
      "def": "An IBM data-communication protocol.",
    },
    {
      "id": 1,
      "word": "SDSL",
      "def": "Symmetric Digital Subscriber Line.",
    },
    {
      "id": 1,
      "word": "SE",
      "def":
          "Shielding Effectiveness - The reduction in field strength resulting from interposing a metallic barrier between a source and receptor of electromagnetic energy.",
    },
    {
      "id": 1,
      "word": "Sealant",
      "def":
          "Soft, tacky, pliable material that seals where mechanical strength is not required.",
    },
    {
      "id": 1,
      "word": "Sealed",
      "def":
          "Environmentally protected by the thermoplastic inserts or core of encapsulant/ adhesive that has melted down around the substrate.",
    },
    {
      "id": 1,
      "word": "sealing plug",
      "def":
          "A plug used to fill and seal an unoccupied contact cavity in a housing or insert. Its role is especially vital in environmental connectors.",
    },
    {
      "id": 1,
      "word": "Secant Modulus",
      "def":
          "A measure of material stiffness; stiffer material has a higher secant modulus. More specifically, the secant modulus is the ratio of stress (nominal) to corresponding strain at any specified point on the stress-strain curve.It is expressed in force per unit area (usually kilograms per square centimeters or pounds per square inch), and reported together with the specified stress or strain.",
    },
    {
      "id": 1,
      "word": "Secondary Circuit",
      "def":
          "Output side of an isolated DC-DC converter. Also see Primary Circuit.",
    },
    {
      "id": 1,
      "word": "Secondary Winding",
      "def":
          "The winding in a transformer that supplies the load with electrical energy which has been converted from the induced magnetic energy in the core.",
    },
    {
      "id": 1,
      "word": "sector",
      "def":
          "The smallest addressable unit of information (set of bits) in a drum or disk memory.",
    },
    {
      "id": 1,
      "word": "selective plating",
      "def":
          "A process of plating only a selected portion of a contact, usually the mating surface. Two methods can be used: 1) Nickel plating the entire contact, then gold plating the selected area. 2) Nickel plating and then gold flash over the entire contact, and finally a selective heavy gold plating in the desired contact area.",
    },
    {
      "id": 1,
      "word": "Self Resonant Frequency",
      "def":
          "SRF - The frequency at which an inductor's distributed capacitance resonates with the inductance. The inductive reactance and the capacitive reactance are equal. The inductor acts as a pure resistance. The Q of an inductor is equal to zero at the SRF.",
    },
    {
      "id": 1,
      "word": "self-aligning",
      "def":
          "Mating parts designed so that they can engage only in the proper relative position.",
    },
    {
      "id": 1,
      "word": "self-extinguishing",
      "def":
          "A loosely-used term describing a material's ability to cease burning when the source of flame is removed. See also flame resistance.",
    },
    {
      "id": 1,
      "word": "Self-Inductance",
      "def": "Another way of saying inductance.",
    },
    {
      "id": 1,
      "word": "Self-Powered Hub",
      "def":
          "Class of devices that derive power from its own source. Examples include monitors and self-powered USB hubs.",
    },
    {
      "id": 1,
      "word": "SEM",
      "def":
          "Scanning electron microscope, in which a beam of electrons systematically sweeps over the specimen. The intensity of the secondary electrons generated at the point of impact is measured, and the resulting signal is fed to a CRT display, which is scanned in synchronism with the scanning of the specimen.",
    },
    {
      "id": 1,
      "word": "semiconductor",
      "def":
          "Materials whose electrical conductivity is between that for good conductors and that for good insulators. Their conductivity may be changed by heat, light, electric field, or magnetic field. Examples include: germanium, lead sulfide, lead telluride, selenium, silicon, and silicon carbide. A semiconductor device, such as a transistor, is frequently referred to simply as a 'semiconductor.'",
    },
    {
      "id": 1,
      "word": "semiconductor device",
      "def":
          "A solid state electronic device in which conduction takes place within a semiconductor. By careful processing, certain semiconductors (primarily germanium and silicon) can be used in these electronic devices which perform many or all of the functions of thermionic tubes (vacuum tubes). In many applications, their small size, long life, and low power requirements make them superior to tubes.",
    },
    {
      "id": 1,
      "word": "semi-rigid",
      "def":
          "A cable containing a flexible inner core and a relatively inflexible sheathing.",
    },
    {
      "id": 1,
      "word": "Sendust",
      "def":
          "A 9% silicon, 6% aluminum, and 85% iron alloy in particulate form. The particles are coated with a dielectric film, compacted, and cured to form magnetic parts such as inductor cores.",
    },
    {
      "id": 1,
      "word": "Sense Line",
      "def":
          "Output line used in a remote sensing connection to route the output voltage (at the load) back to the control feedback loop. Also see Remote Sensing.",
    },
    {
      "id": 1,
      "word": "sensitivity",
      "def":
          "Measure of the ability of a device or circuit to react to a change in some input. Sensitivity can also be the minimum or required level of an input necessary to obtain rated output, as in an amplifier. For a fiber-optic receiver, the minimum optical power required to achieve a specified level of performance, such as a BER.",
    },
    {
      "id": 1,
      "word": "sensitivity switch",
      "def":
          "A switch having a snapaction, microgap mechanism which is operated directly by a defined force through a defined travel.",
    },
    {
      "id": 1,
      "word": "separable part",
      "def":
          "A replaceable part, designed to be removed without risk of destroying or damaging adjacent elements. Crimping, chemical bonding, etc preclude assurance of safe removal, and parts so attached would not be deemed separable. Protective coatings, solder, etc normally do not preclude safe removal, and parts so treated - barring other factors - may still be classified as separable.",
    },
    {
      "id": 1,
      "word": "separating force",
      "def":
          "Force required to either engage or separate contacts - both in and out of the connector housing or insert. Values are generally established for maximum and minimum forces. Performance acceptance level vary per specification or customer requirements. Sometimes the forces are not only measured initially, but also after specified number of engagements and separations.",
    },
    {
      "id": 1,
      "word": "sequencer",
      "def":
          "A mechanical or electronic device used to initiate and control the predetermined sequence of a series of events.",
    },
    {
      "id": 1,
      "word": "sequencing",
      "def":
          "The process of performing a series of operations in a predetermined order.",
    },
    {
      "id": 1,
      "word": "serial memory",
      "def":
          "A memory whose information media is continuous. Data is identified in its content or form. Data may be obtained only by performing a serial search through the contents of the memory. A magnetic tape is serial.",
    },
    {
      "id": 1,
      "word": "serial operation",
      "def":
          "The flow of information through a device in time sequence - using only one digit, word, line, or channel at a time. For example, all bits of an 8-bit word are transmitted one bit at a time over a single line. Much slower than parallel operation.",
    },
    {
      "id": 1,
      "word": "serial transfer",
      "def":
          "Data transfer in which elements of information are transferred sequentially.",
    },
    {
      "id": 1,
      "word": "serial transmission",
      "def":
          "Transmitting character bits in line sequence. Generally used in telegraphic-type operation.",
    },
    {
      "id": 1,
      "word": "series",
      "def":
          "Connecting components in a circuit end-to-end to provide a single path for current flow.",
    },
    {
      "id": 1,
      "word": "Series Operation",
      "def":
          "Master-slave configuration in which two or more isolated converters are connected to obtain a hgher output voltage level (converter inputs connected in parallel) or wider input voltage range (converter inputs connected in series) than that obtainable from one module. Also see Master-Slave Operation.",
    },
    {
      "id": 1,
      "word": "Series Regulator",
      "def":
          "Linear regultor (internal or external to the converter)placed in a series with the load to ahcieve a constant voltage across the load. This is the most popular method of linear regulation. Also see Linear Regulation, Post Regulation and Shunt Regulator.",
    },
    {
      "id": 1,
      "word": "Series Resistance",
      "def":
          "The real part of the complex impedance of a semiconductor device. The resistance of the semiconductor package, die attach and bond wire are typically included in series resistance.",
    },
    {
      "id": 1,
      "word": "Series-Shunt",
      "def":
          "The circuit configuration including two components, the first in series with the transmission line and the second in shunt with the transmission line.",
    },
    {
      "id": 1,
      "word": "serrations",
      "def":
          "The small grooves or indentations within a terminal wire barrel. The serrations increase the tensile strength and improve the electrical conductivity of the crimped termination.",
    },
    {
      "id": 1,
      "word": "Service Life",
      "def":
          "Period of time during which the product is expected to perform satisfactorily.",
    },
    {
      "id": 1,
      "word": "Service Loop",
      "def":
          "The extra cable required at a breakout to facilitate maintenance and servicing.",
    },
    {
      "id": 1,
      "word": "Service Rating",
      "def":
          "The maximum voltage or current that a termination is designed to carry continuously.",
    },
    {
      "id": 1,
      "word": "Set Up Transformer",
      "def": "When the secondary is at a higher voltage than",
    },
    {
      "id": 1,
      "word": "Settling Time",
      "def":
          "The time required for the device to attain 90 percent of the detected RF output referenced to the 10 percent level.",
    },
    {
      "id": 1,
      "word": "S-HDSL",
      "def": "Single pair transmission using HDSL technology, normally 2B1Q.",
    },
    {
      "id": 1,
      "word": "sheath",
      "def":
          "The outer covering or jacket over the insulated conductors to provide mechanical protection for the conductors. Also known as the external conducting surface of a shielded transmission line.",
    },
    {
      "id": 1,
      "word": "Shelf Life",
      "def":
          "Generally, the length of time a product or material may be stored without deterioration. Specifically, the length of time during which shrink tubing will retain its expanded ID and return to its recovered ID. Usually not a concern?except for some ?amnesic? materials. See Amnesia.",
    },
    {
      "id": 1,
      "word": "Shell",
      "def":
          "The outside case, usually metallic, into which the insert (body) and contacts are assembled. Shells of mating connector halves usually provide for proper alignment and polarization as well as for protection of projecting contacts.",
    },
    {
      "id": 1,
      "word": "shf",
      "def": "See superhigh frequency.",
    },
    {
      "id": 1,
      "word": "Shield",
      "def":
          "A conducting layer placed around an insulated conductor or cable to limit the penetration, or escape, of electric or electromagnetic fields, thereby preventing electromagnetic interference. The shield may be formed of metallic braid, metal tape, metal-backed foil, metal tube, or conductive polymer. Usually grounded, the shielding is carried through the connector shell, or through a special internal shell in the case of individual coaxial contacts.",
    },
    {
      "id": 1,
      "word": "Shielded Inductor",
      "def":
          "An inductor designed for its core to contain a majority of its magnetic field. Some inductor designs are self shielding. Examples of these are magnetic core shapes which include toroids, pot cores and B-Cores. Magnetic core shapes such as slug cores and bobbins require the application of a magnetic sleeve or similar method to yield a shielded inductor. It should be noted that magnetic shielding is a matter of degree. A certain percentage of the magnetic field will escape the core material. This is even applicable to toroidal cores as lower core permeabilities will have higher fringing field than will high permeability toroidal cores (Also see Closed Magnetic Path.)",
    },
    {
      "id": 1,
      "word": "shielded keyboard",
      "def":
          "A keyboard assembly that has been designed to withstand severe EMI environments. Such shielding can also prevent noise from the keyboard from affecting nearby equipment.",
    },
    {
      "id": 1,
      "word": "shielded room",
      "def":
          "A room, used for EMI testing, having highly conductive walls that isolate the interior from the exterior to contain energy within the room and to prevent outside energy from entering the room.",
    },
    {
      "id": 1,
      "word": "shielding",
      "def":
          "(1) A conducting envelope, composed of metal strands, that encloses a wire, group of wires, or cable, so constructed that substantially every point on the surface of the underlying insulation is at ground potential or at some predetermined potential with respect to ground. (2) An isolation barrier placed around a circuit component to prevent interaction of its electric and/or magnetic fields with those of nearby elements. Shielding protects a circuit against crosstalk.",
    },
    {
      "id": 1,
      "word": "shielding effectiveness",
      "def":
          "A measure of the performance of a shield, typically expressed in decibels as (1) the ratio of energy incident on the shield to that emerging on the other side or (2) the ratio of energy emitted from an unshielded sample to the energy emitted by the same sample when it is shielded.",
    },
    {
      "id": 1,
      "word": "shift",
      "def":
          "To move information serially right or left in a register(s). Information shifted out of a register may be lost, or it may be re-entered at the other end of the register.",
    },
    {
      "id": 1,
      "word": "shift register",
      "def":
          "A shift register is an electronic device which can contain several bits of information. Shift registers are normally used to collect variable input data and send this data out in a predetermined pattern.",
    },
    {
      "id": 1,
      "word": "shock",
      "def":
          "(1) An abrupt impact applied to a stationary object. Usually expressed in gravities (g). (2)An abrupt and nonperiodic change in position, characterized by suddenness, and by development of substantial internal forces.",
    },
    {
      "id": 1,
      "word": "Shore",
      "def":
          "A scale for comparing hardness. Higher Shore values represent harder materials. The hardness of a polymer, for example, is usually represented as Shore A or Shore D, with D being harder.",
    },
    {
      "id": 1,
      "word": "Short Circuit Protection",
      "def":
          "Maximum steady-state current level at which the power switch output is regulated in response to an overcurrent fault.",
    },
    {
      "id": 1,
      "word": "Shot noise",
      "def":
          "Noise caused by random current fluctuations arising from the discrete nature of electrons.",
    },
    {
      "id": 1,
      "word": "Shrink Ratio",
      "def":
          "An expression of how much the inside diameter of shrink tubing will reduce in size when recovered. The inverse of the expansion ratio. See also Expansion Ratio.",
    },
    {
      "id": 1,
      "word": "Shunt",
      "def": "In parallel with; connector used to common two circuits.",
    },
    {
      "id": 1,
      "word": "Shunt Regulator",
      "def":
          "Linear regulator (internal or external to the converter) placed in parallel with the load to achieve a constant voltage across the load. Also see Linear Regulation, Post Regulation and Series Regulator.",
    },
    {
      "id": 1,
      "word": "SHV",
      "def":
          "Standard High Voltage - A quick connect/disconnect connector series employing bayonet lock coupling and designed to operate safely up to 5000 volts ac. It is the industry standard connector, specified by the National Bureau of Standards (NBS) for high voltage use by the Atomic Energy Commission (AEC).",
    },
    {
      "id": 1,
      "word": "Sideband Suppression",
      "def":
          "In a mixer or modulator, the degree to which undesired sidebands are reduced in amplitude.",
    },
    {
      "id": 1,
      "word": "sign bit",
      "def":
          "Computers generally indicate whether a number is positive or negative by a sign bit, which is usually located adjacent to the most significant numerical digit. Usually zero (0) is used for positive (+) and one (1) for negative (-).",
    },
    {
      "id": 1,
      "word": "Signal Cable",
      "def":
          "A cable designed to carry current of less than 12 amperes per conductor.",
    },
    {
      "id": 1,
      "word": "Signal Frequency",
      "def":
          "In a mixer or detector, this is the desired RF or microwave frequency containing information (modulation). This is the frequency that is to be converted to a different (normally lower) frequency.",
    },
    {
      "id": 1,
      "word": "Signal Rise Time",
      "def":
          "The time for a signal to switch from low to high, usually measured between 10% and 90% of the maximum amplitude.",
    },
    {
      "id": 1,
      "word": "signal-to-noise ratio",
      "def":
          "SNR - The ratio of signal strength to noise level in an electronic system.",
    },
    {
      "id": 1,
      "word": "significant digit",
      "def":
          "A digit that contributes to the preciseness of a number. The number of significant digits is counted beginning with the digit contributing the most value, called the most significant digit, and ending with the one contributing the least value, called the least significant digit.",
    },
    {
      "id": 1,
      "word": "silicon",
      "def":
          "The semiconductor material most widely used for transistors, diodes, and monolithic integrated circuits. A brittle, gray, light metal.",
    },
    {
      "id": 1,
      "word": "silicon dioxide",
      "def":
          "The result of oxidizing silicon quartz. Selectively etched silicon dioxide permits the selective doping that generates components in monolithic integrated circuits.",
    },
    {
      "id": 1,
      "word": "silicon nitride",
      "def":
          "A silicon compound that is deposited on the surface of silicon monolithic integrated circuits to improve their stability. The nitride is relatively impervious to some ions that penetrate silicon dioxide. Best stability is obtained by a combination of silicon nitride and silicon dioxide. Charge storage at the interface of the nitride and dioxide layers has resulted in memory devices with extremely long retention times.",
    },
    {
      "id": 1,
      "word": "silicon oxide",
      "def":
          "A generic term referring to an unspecified mixture of silicon monoxide and silicon dioxide, such as may be deposited on a silicon integrated circuit as an insulator between runs in multilevel metallization.",
    },
    {
      "id": 1,
      "word": "silicon-controlled rectifier",
      "def":
          "SCR - A semiconductor device capable of only two stable states. When 'off,' it blocks the flow of electricity in either direction. A small triggering voltage to its gate turns it 'on,' and allows the flow of electricity in the forward direction only. When 'on,' the SCR acts just like a conventional rectifier. To turn it 'off,' voltage to the anode must be removed, or reduced to a potential less than that being applied to the cathode.",
    },
    {
      "id": 1,
      "word": "silicon-controlled switch",
      "def":
          "SCS - A semiconductor device with leads to all four regions. Can be integrated with transistors in monolithic integrated circuits. Useful as a small SCR or complementary SCR.",
    },
    {
      "id": 1,
      "word": "silo",
      "def":
          "A housing construction feature which increases the electrical current creepage path for high voltage ratings. May also provide polarization for mating connectors.",
    },
    {
      "id": 1,
      "word": "Simple Network Management Protocol",
      "def":
          "SNMP - A network management standard initially established to allow multi-vendor networking devices to be managed more easily with common management tools.",
    },
    {
      "id": 1,
      "word": "Simple Winding",
      "def":
          "A winding for a toroidal core which results in 78% of the cores inside diameter remaining. Often times this will produce a single layer winding.",
    },
    {
      "id": 1,
      "word": "simplex",
      "def":
          "A circuit which allows telecommunications in only one direction at a time; a one-way path for telegraph-type signals.",
    },
    {
      "id": 1,
      "word": "Simplex cable",
      "def": "A term sometimes used for a single-fiber cable.",
    },
    {
      "id": 1,
      "word": "Simplex transmission",
      "def": "Transmission in one direction only.",
    },
    {
      "id": 1,
      "word": "sine wave",
      "def":
          "A wave which can be expressed as the sine of a linear function of time, space, or both. A waveform (often viewed on an oscilloscope) of a pure alternating current or voltage.",
    },
    {
      "id": 1,
      "word": "Single Ended Mixer",
      "def":
          "The simplest form of mixer, which consists of a single nonlinear impedance connected across an unbalanced transmission line, to which RF and LO signals are applied and from which the IF signal is obtained.",
    },
    {
      "id": 1,
      "word": "Single Layer Winding",
      "def":
          "A winding for a toroidal core which will result in the full utilization of the inside circumference of the core without overlapping of turns. The thickness of the wire and tightness of the winding will affect results.",
    },
    {
      "id": 1,
      "word": "single mode",
      "def":
          "A fiber that allows only one path for the light to take due to the fiber's very small diameter - less than 10 microns.",
    },
    {
      "id": 1,
      "word": "Singlemode",
      "def":
          "A type of optical fiber in which the light travels in a single path. Utilizes lasers as a light source.",
    },
    {
      "id": 1,
      "word": "Single-mode fiber",
      "def":
          "An optical fiber that supports only one mode of light propa-gation above the cutoff wavelength.",
    },
    {
      "id": 1,
      "word": "single-pole",
      "def":
          "A contact arrangement wherein all contacts - in one position or another - connect to one common contact.",
    },
    {
      "id": 1,
      "word": "Sintered Iron",
      "def":
          "Powdered iron that has been pressed and sintered into a structural form. This type of material occasionally is used in a magnetic application, but they normally exhibit excessive core losses.",
    },
    {
      "id": 1,
      "word": "Six-Sided Shielding",
      "def":
          "Converter packaging technique in which the unit is placed into a metal case. Theis metal shielding minimized any noise radiation from the converter components. A continous shielded case has the base (or header) welded on, further reducing potential noise leakage.",
    },
    {
      "id": 1,
      "word": "Skew",
      "def":
          "Any out-of-squareness of the cut end of a piece of tubing after shrinking.",
    },
    {
      "id": 1,
      "word": "Skewing Of The Loop",
      "def":
          "When an air gap is added to a magnetic path, the hysteresis loop is made to lean over (permeability is reduced). It is said to be skewed or sheared.",
    },
    {
      "id": 1,
      "word": "Skin Effect",
      "def":
          "Skin effect is the tendency for alternating current to flow near the surface of the conductor in lieu of flowing in a manner as to utilzie the entire cross-sectional area of tile conductor. Ths phenomenon causes the resistance of the conductor to increase. The magnetic field associated with the current in teh conductor causes eddy currents near the center of the conductor which opposes the flow of the main current flow near the center of the conductor. The main current flow is forced further to the surface as the frequency of the alternating current increasing (Also see Litz Wire.)",
    },
    {
      "id": 1,
      "word": "sleeve",
      "def":
          "The insulated, or metallic, covering over the barrel of the terminal.",
    },
    {
      "id": 1,
      "word": "slotted tongue",
      "def":
          "A terminal that has a slot rather than a hole in the tongue, so that the terminal can be engaged and disengaged from a stud without completely removing the nut.",
    },
    {
      "id": 1,
      "word": "Slug Core",
      "def":
          "A core shaped like a rod, with the winding(s) placed around the diameter.",
    },
    {
      "id": 1,
      "word": "SMA connector",
      "def":
          "A radio-frequency connector covered by Military Specification. It has an impedance of 50 ohms and an operating frequency range to 12.4 GHz.",
    },
    {
      "id": 1,
      "word": "Small Signal",
      "def":
          "The magnitude of an AC signal which, when its amplitude is halved or doubled, the characteristic under measurement does not change.",
    },
    {
      "id": 1,
      "word": "Small Signal Analysis",
      "def":
          "The consideration of the performance of a circuit or device under small signal conditions",
    },
    {
      "id": 1,
      "word": "small-scale integration",
      "def":
          "SSI - A single circuit function implemented in monolithic silicon. In complexity, a circuit of less than 10 gates.",
    },
    {
      "id": 1,
      "word": "SMD",
      "def": "Surface Mount Device",
    },
    {
      "id": 1,
      "word": "Smith Chart",
      "def":
          "A mapping of the complex impedance plane onto a polar plot. A Smith chart consists of circles of constant resistance that intersect at Z = ? and arcs of constant reactance that also intersect at Z = ?. The horizontal diameter of the Smith chart represents pure resistances from a short (0 W) at one end to an open (? W) at the other end. The Smith chart was developed by Philip H. Smith in the late 1930's.",
    },
    {
      "id": 1,
      "word": "SMO",
      "def":
          "Special Manufacturing Order - An order to evaluate manufacturing and production capability for a new or changed design for a customer and to provide development samples of potential products for customers. SMO products are separate and distinct from standard products. New, potential products are usually run as SMO products for a minimum of three times before being considered for manufacture as a standard product.",
    },
    {
      "id": 1,
      "word": "SMR",
      "def":
          "Specialized mobile radio. A communications service at 800 MHz and 900 MHz used to provide dispatch messaging and cellular communications.",
    },
    {
      "id": 1,
      "word": "SMS",
      "def": "Short Message System",
    },
    {
      "id": 1,
      "word": "Snap Time",
      "def":
          "The time required for a varactor or step recovery diode to change from the conducting to non-conducting state after reverse bias is applied, excluding the time required for charge to be conducted from the junction. It is normally measured from the 90 percent to 10 percent reverse current states. Also called transition time",
    },
    {
      "id": 1,
      "word": "SNR",
      "def":
          "Signal-to-noise ratio - The ratio of signal strength to noise level in an electronic system.",
    },
    {
      "id": 1,
      "word": "socket contact",
      "def":
          "A female contact designed to mate with a male contact or pin. It is normally connected to the 'hot' side of the circuit because the housings that accept sockets usually fully surround, insulate, and protect the contact.",
    },
    {
      "id": 1,
      "word": "Soft Magnetic Material",
      "def":
          "A ferromagnetic material that is easily magnetized and demagnetized.",
    },
    {
      "id": 1,
      "word": "Soft Start",
      "def":
          "Converter input circuit that limits the inrush of current at turn on.",
    },
    {
      "id": 1,
      "word": "software",
      "def": "Computer programs.",
    },
    {
      "id": 1,
      "word": "SOG",
      "def":
          "Speed over Ground. (The actual speed the GPS unit is moving over the ground)",
    },
    {
      "id": 1,
      "word": "SOHO",
      "def": "small office/home office",
    },
    {
      "id": 1,
      "word": "Solder",
      "def":
          "An alloy that melts at relatively low temperatures and is used to join metals with higher melt points.",
    },
    {
      "id": 1,
      "word": "solder",
      "def":
          "An alloy that can be melted at a fairly low temperature, for use in joining metals having much higher melting points. An alloy of tin and lead in approximately equal proportions is the solder most often used for making permanent joints in circuits.",
    },
    {
      "id": 1,
      "word": "Solder Contact",
      "def":
          "A contact or terminal having a cup, hollow cylinder, eyelet, or hook to accept a wire for a conventional soldered termination.",
    },
    {
      "id": 1,
      "word": "Solder Cup",
      "def":
          "A tubular end of a terminal into which a wire conductor is inserted prior to being soldered.",
    },
    {
      "id": 1,
      "word": "Solderability",
      "def":
          "The property of a metal surface that allows it to be readily wetted by molten solder. See also Wetting.",
    },
    {
      "id": 1,
      "word": "solder-eyelet",
      "def":
          "A solder-type terminal, having a hole at its end through which a wire can be inserted prior to being soldered. See also eyelet.",
    },
    {
      "id": 1,
      "word": "Soldering",
      "def":
          "A process of joining metallic surfaces with solder without melting the base metal.",
    },
    {
      "id": 1,
      "word": "solderless",
      "def": "Without the use of solder.",
    },
    {
      "id": 1,
      "word": "SolderSleeve Device",
      "def":
          "A device of flux-coated solder preform encapsulated in a heat-recoverable plastic sleeve. Upon the application of heat, the flux and solder will melt and flow as the sleeve recovers, forcing the solder around and onto the metallic parts being joined, thus forming an electrically insulated and strain-relieved joint.",
    },
    {
      "id": 1,
      "word": "solenoid",
      "def":
          "An electrical conductor wound as a coil (helix) with a small pitch. When activated with an electrical current, it draws a movable core into the coil.",
    },
    {
      "id": 1,
      "word": "Solid Conductor",
      "def": "A conductor composed of one single strand.",
    },
    {
      "id": 1,
      "word": "Solid State",
      "def":
          "In electronics, having or pertaining to circuits that contain semiconductors. Note: In electro-optics, used to refer to lasers and related devices made of solid crystalline or amorphous materials other than semiconductors.",
    },
    {
      "id": 1,
      "word": "Soliton",
      "def": "An optical pulse that does not disperse over distance.",
    },
    {
      "id": 1,
      "word": "Solvent Resistance",
      "def":
          "The ability of a material to retain physical and electrical properties after being immersed in specific solvents.",
    },
    {
      "id": 1,
      "word": "Solvent Resistance Test",
      "def":
          "A test described in Raychem's PS300 publication to test the durability of the markings on PolySwitch devices when exposed to various solvents.",
    },
    {
      "id": 1,
      "word": "Solvent Resistance Test",
      "def":
          "A test described in Raychem's PS300 publication to test the durability of the markings on PolySwitch devices when exposed to various solvents.",
    },
    {
      "id": 1,
      "word": "SOM",
      "def": "start of message",
    },
    {
      "id": 1,
      "word": "SONET",
      "def":
          "Synchronous Optical Network- A recently emerging networking standard that utilizes fiber optics to create backbone networks, capable of transmitting at extremely high speeds and accommodating gigabit-level bandwidth.",
    },
    {
      "id": 1,
      "word": "sophisticated",
      "def":
          "Complex and intricate utilization of advanced art; requiring specific skills to operate.",
    },
    {
      "id": 1,
      "word": "Sorted",
      "def":
          "Binned refers to resistance-matched devices, which are supplied such that all parts in one particular package (or reel) are within 0.5 ohms of each other (1.0 ohms for TR250-080T devices). Individual matched packages are supplied from the full resistance range of the specified device. The benefit is that resistance-matched devices reduce the tip-ring resistance differential, reducing the possibility of line imbalance. Sorted devices are those that are supplied with resistance values that are within specified segments of the device's full range of resistance, giving greater design flexibility.",
    },
    {
      "id": 1,
      "word": "Source",
      "def":
          "(1) The terminal at one end of the channel of a field effect transistor by which electron or hole current enters the channel. This terminal corresponds to the emitter in a bipolar transistor. (2) Power bus that drives the DC-DC converter. Also see Bus. (3) The light emitter, either an LED or laser diode, in a fiber-optic link. Spectral width A measure of the extent of a spectrum. For a source, the width of wavelengths contained in the output at one half of the wavelength of peak power. Typical spectral widths are 20 to 60 nm for an LED and 2 to 5 nm for a laser diode.",
    },
    {
      "id": 1,
      "word": "spade",
      "def": "A terminal with a slotted tongue that has nearly square sides.",
    },
    {
      "id": 1,
      "word": "Spanning Tree",
      "def":
          "An algorithm, the original version of which was invented by Digital Equipment Corporation used to prevent bridging loops by creating a spanning tree. The algorithm is now documented in the IEEE 802.1d specification, although the Digital algorithm and the IEEE 802.1d algorithm are not the same, nor are they compatible.",
    },
    {
      "id": 1,
      "word": "Spare Inputs",
      "def": "Extra inputs or unused inputs",
    },
    {
      "id": 1,
      "word": "Sparkover",
      "def": "A disruptive discharge between electrodes of a measuring gap",
    },
    {
      "id": 1,
      "word": "SPC",
      "def": "Silver-plated copper.",
    },
    {
      "id": 1,
      "word": "SPC",
      "def":
          "Statistical Process Control - The use of statistical techniques such as control charts to analyze a process or its output so as to take appropriate actions to achieve and maintain a state of control and to improve the capability of the process.",
    },
    {
      "id": 1,
      "word": "spdt",
      "def":
          "single-pole, double-throw - A three-contact switching arrangement which connects a circuit to either one of two alternate connections (called Form C).",
    },
    {
      "id": 1,
      "word": "specific gravity",
      "def":
          "The density (mass per unit volume) of any material divided by that of water at a standard temperature.",
    },
    {
      "id": 1,
      "word": "Specific Inductive Capacity",
      "def":
          "(also K) The ratio of the capacitance between two electrodes with a solid, liquid, or gaseous dielectric, to the capacitance with air between the electrodes. Also called permittivity and dielectric constant.Generally low values are desirable for insulation.",
    },
    {
      "id": 1,
      "word": "Specification Control Drawing",
      "def":
          "SCD - Drawing that defines configuration and material parameters. Issued and controlled by the specifications group, SCDs are frequently used in conjunction with RT Specifications for Thermofit products.",
    },
    {
      "id": 1,
      "word": "specs",
      "def":
          "Abbreviation for specifications. A control document which establishes the parameters that a given product, or type of product, must meet. Firms use specifications for control in manufacture, Government agencies use them for control in procurement, and other bodies - such as UL - use them as a basis for approval.",
    },
    {
      "id": 1,
      "word": "spectral dispersion",
      "def":
          "Due to a band of wavelengths (colors) put out by a light source. Each separate color has a different speed through the fiber causing different colors to arrive at different times, making the pulse appear longer than originally generated.",
    },
    {
      "id": 1,
      "word": "SPICE",
      "def":
          "Semiconductor Parameter In Circuit Emulator - a software package that emulates circuit performance utilizing time domain analysis",
    },
    {
      "id": 1,
      "word": "Splice",
      "def":
          "A joint connecting conductors with good mechanical strength and conductivity; a terminal that permanently joins two or more wires.",
    },
    {
      "id": 1,
      "word": "Splitter",
      "def":
          "A component that divides the power from a signal into two or more parts",
    },
    {
      "id": 1,
      "word": "spring properties",
      "def":
          "The relationship between applied force and resulting deflection which characterize the potential loading conditions of a given system (ie, usually refers to the elastic properties of a system).",
    },
    {
      "id": 1,
      "word": "spring-finger action",
      "def":
          "A type of spring design - as used in a printed circuit connector or a socket contact - which permits easy, stress-free spring action to provide contact pressure and/or retention.",
    },
    {
      "id": 1,
      "word": "SPS",
      "def": "Standard Positioning Service (see also PPS)",
    },
    {
      "id": 1,
      "word": "spst",
      "def":
          "single-pole, single-throw - A two contact switching arrangement which either opens or closes one circuit. This circuit may be normally open (NO, called Form A), or normally closed (NC, called Form B).",
    },
    {
      "id": 1,
      "word": "Spurious",
      "def":
          "Undesired signals present at the output of a device under test that are neither harmonics nor intermodulation products, sometimes expressed as a percentage of or decibels below the carrier.",
    },
    {
      "id": 1,
      "word": "sputtering",
      "def":
          "A thin film technique in which the film material is ejected from the surface by the action of ion bombardment.",
    },
    {
      "id": 1,
      "word": "Square Wave",
      "def":
          "An excitation that consists of an abrupt on/off cycling of the voltage. This typically goes in both the positive and negative direction. A positive-only square wave would be typical of pulse excitation.",
    },
    {
      "id": 1,
      "word": "Square-Law Detection",
      "def":
          "Detection of an RF/microwave signal where the magnitude of the detected video output voltage is proportional to the square of the RF input voltage",
    },
    {
      "id": 1,
      "word": "Square-Law Detector",
      "def":
          "A detector circuit or device whose video output voltage is proportional to the square of the RF input voltage",
    },
    {
      "id": 1,
      "word": "Squareness Ratio",
      "def":
          "The ratio of residual flux density to the maximum (saturation) flux density.",
    },
    {
      "id": 1,
      "word": "SRF",
      "def":
          "Self Resonant Frequency - The frequency at which tile inductor;s distributed capacitance resonates with the inductance. It is at this frequency that the inductance is equal to the capacitance and they cancel each other. The inductor will act purely resistive with a high impedance at the SRF point. The distributed capacitance is caused by the turns of ~re layered on top of each other and around the core. This capacitance is in parallel to the inductance. At frequencies above the SRF, the capacitive reactance of the parallel combination will become the dominant component. Also, tile Q of the inductor is equal to zero at the SRF point since the inductive reactance is zero. The SRF is specified in Mhz and is listed as a minimum value on product data sheets (Also see Distributed Capacitance)",
    },
    {
      "id": 1,
      "word": "SSI",
      "def":
          "Small Scale Integration - A single circuit function implemented in monolithic silicon. In complexity, a circuit of less than 10 gates.",
    },
    {
      "id": 1,
      "word": "ST connector",
      "def":
          "A bayonet style optical fiber connector.An alternate style per the 568 standard.",
    },
    {
      "id": 1,
      "word": "stamped and formed contact",
      "def":
          "A contact which is stamped from a flat sheet of metal and then formed through a progressive die.",
    },
    {
      "id": 1,
      "word": "Standby Current",
      "def":
          "Current drawn by a converter when it has no load and has been shut down by a logical inhibit signal.",
    },
    {
      "id": 1,
      "word": "Standing Wave Ratio",
      "def":
          "The ratio of the maximum magnitude of a standing wave to the minimum magnitude. SWR is indicative of the degree to which there is a mismatch between the characteristic impedance of the transmission medium and its load. A standing wave ratio of 1:1 indicates a perfect match (all the power incident on the load is absorbed by the load), while SWR = ? indicates a complete mismatch (all the power incident on the load is reflected by the load).",
    },
    {
      "id": 1,
      "word": "Standing Waves",
      "def":
          "The sum along a transmission medium of incident and reflected waves, characterized by maxima and minima along the medium.",
    },
    {
      "id": 1,
      "word": "standing-wave",
      "def":
          "Distribution of current and voltage on a transmission line, resulting from two sets of waves traveling in opposite directions.",
    },
    {
      "id": 1,
      "word": "standing-wave ratio",
      "def":
          "SWR - The ratio between maximum and minimum current, or voltage, along a line. It is a measure of the mismatch between the load and the line, and is equal to 1 when the line impedance is perfectly matched to the load. (In that case the maximum and minimum are the same, as current and voltage do not vary along the line.) The perfect match would be referred to as a 1 to 1 ratio. Vswr is voltage standing wave ratio.",
    },
    {
      "id": 1,
      "word": "Star coupler",
      "def":
          "A fiber-optic coupler in which power at any input port is distributed to all output ports.",
    },
    {
      "id": 1,
      "word": "Star network",
      "def":
          "A network in which all terminals are connected through a single point, such as a star coupler.",
    },
    {
      "id": 1,
      "word": "start of message",
      "def":
          "SOM - Usually a unique character in a data stream that indicates the beginning of a block of information data. See also start sentinel.",
    },
    {
      "id": 1,
      "word": "start sentinel",
      "def":
          "The binary coded character used to determine the start of a message on a magnetic stripe credit card.",
    },
    {
      "id": 1,
      "word": "State Machine",
      "def":
          "A sequential network is used to control a digital system that carries out a step by step procedure or algorithm",
    },
    {
      "id": 1,
      "word": "Statistical Process Control",
      "def":
          "SPC - The use of statistical techniques such as control charts to analyze a process or its output so as to take appropriate actions to achieve and maintain a state of control and to improve the capability of the process.",
    },
    {
      "id": 1,
      "word": "statistical quality control",
      "def":
          "The application of statistical methods to the identification, prediction, measure, and correction of problems in quality control.",
    },
    {
      "id": 1,
      "word": "stator",
      "def":
          "The portion of a rotating machine that contains the stationary parts of the magnetic circuit and their associated windings.",
    },
    {
      "id": 1,
      "word": "Steady state",
      "def": "Equilibrium mode distribution.",
    },
    {
      "id": 1,
      "word": "Step Change",
      "def":
          "Sudden change in a converter parameter. Typically used in referring to changes in output load or input line during converter testing.",
    },
    {
      "id": 1,
      "word": "Step Down Transformer",
      "def": "When the secondary has a lower voltage than the primary.",
    },
    {
      "id": 1,
      "word": "step index",
      "def":
          "A fiber construction where the core is one distinct index of refraction and the cladding a lower one causing the light to travel down a fiber by reflecting off the corecladding interface.",
    },
    {
      "id": 1,
      "word": "Step-index fiber",
      "def":
          "An optical fiber, either multimode or single mode, in which the core refractive index is uniform throughout so that a sharp step in refractive index occurs at the core-to-cladding interface. It usually refers to a multimode fiber.",
    },
    {
      "id": 1,
      "word": "stop sentinel",
      "def":
          "The binary coded character used to determine the end of a message on a magnetic stripe credit card.",
    },
    {
      "id": 1,
      "word": "storage",
      "def": "system memory",
    },
    {
      "id": 1,
      "word": "Storage Temperature Range",
      "def":
          "Range of ambient temperatures over which a component can be stored safely (Also see Operating Temperature Range)",
    },
    {
      "id": 1,
      "word": "STP",
      "def": "Shielded Twisted Pair.2-Pair 150 ohm shielded cable.",
    },
    {
      "id": 1,
      "word": "Strain Relief",
      "def":
          "The technique for or act of removing or lessening the strain or stress on a joint, splice, or termination. SolderSleeve devices provide strain relief.",
    },
    {
      "id": 1,
      "word": "strain relief clamp",
      "def":
          "A device used to give mechanical support for the contacts from the weight of a wire bundle or cable. May be referred to as cable clamp.",
    },
    {
      "id": 1,
      "word": "Strand",
      "def": "A single unit of a conductor.",
    },
    {
      "id": 1,
      "word": "Stranded Conductor",
      "def":
          "A conductor composed of more than one single strand. The strands in stranded conductors are usually twisted or braided together.",
    },
    {
      "id": 1,
      "word": "Strength member",
      "def":
          "That part of a fiber-optic cable composed of Kevlar aramid yarn, steel strands, or fiberglass filaments that increase the tensile strength of the cable.",
    },
    {
      "id": 1,
      "word": "Strip",
      "def":
          "(1) To remove insulation from a wire or cable. (2) 'Strip' terminals (or contacts) are produced in continuous lengths, and placed on reels, for application in automatic or semi-automatic machines.",
    },
    {
      "id": 1,
      "word": "Stripe",
      "def":
          "A continuous longitudinal or spiral color strip applied on the surface of a wire, cable, or tubing for identification.",
    },
    {
      "id": 1,
      "word": "Stripline",
      "def":
          "A multi-layer transmission line that consists of two ground planes, separated by two layers of dielectric material that sandwich between them a thin center conductor that has a rectangular cross section. The impedance of stripline is determined by the thickness and dielectric constant of the dielectric layers and the width of the center conductor.",
    },
    {
      "id": 1,
      "word": "stud",
      "def":
          "A metal rod or pin (bolt) projecting from a piece, for the attachment and/or support of a second piece. The projecting end of the stud most commonly has screw threads, and the second piece is secured with a nut.",
    },
    {
      "id": 1,
      "word": "stud hole",
      "def":
          "The hole or slot in the tongue of a terminal, made to accommodate a screw, bolt, or stud of a given size.",
    },
    {
      "id": 1,
      "word": "styrene-butadiene",
      "def":
          "Copolymer synthetic rubber characterized by good electrical properties and moisture resistance. Ozone resistance, physical properties, and chemical resistance are generally improved by blending with other materials.",
    },
    {
      "id": 1,
      "word": "subassembly",
      "def":
          "Two or more parts which form a portion of an assembly (or a unit replaceable as a whole), but having a part or parts which are individually replaceable.",
    },
    {
      "id": 1,
      "word": "subminiaturization",
      "def":
          "The packaging of miniaturized parts, using unusual assembly techniques to increase volumetric efficiency.",
    },
    {
      "id": 1,
      "word": "substrate",
      "def":
          "The physical material on, or within, which the elements of an integrated circuit are fabricated. Ceramic, plastic, and glass substrates satisfy the primary functions of mechanical support and insulation, but semiconductor and ferrite substrates may also provide useful electrical functions. See also wafer.",
    },
    {
      "id": 1,
      "word": "subsystem",
      "def":
          "An interconnection combination of a set of related circuits, which form a logical subdivision of an equipment or operational system.",
    },
    {
      "id": 1,
      "word": "SUPER CHAMP",
      "def":
          "The AMP trademark for a stamped hand tool designed to crimp 22-10 insulated terminals. This tool also cuts and strips wire and shears 4/40 through 10/32 bolts.",
    },
    {
      "id": 1,
      "word": "Super Compact",
      "def":
          "A software package that analyzes and optimizes RF/microwave circuits using frequency domain analysis.",
    },
    {
      "id": 1,
      "word": "superhigh frequency",
      "def":
          "shf - A Federal Communications Commission designation for the band from 3,000 to 30,000 MHz in the radio spectrum.",
    },
    {
      "id": 1,
      "word": "Supply Current",
      "def":
          "Rated output current of a given device. Power switch devices have been designed to support a continuous load (supply) current of 0.6A at ambient temperature.",
    },
    {
      "id": 1,
      "word": "Supply Voltage",
      "def":
          "Voltage level of the power switch input. Raychem power switch devices have been designed to operate using supply voltage levels from 3.0V to 5.5V.",
    },
    {
      "id": 1,
      "word": "Surface Area",
      "def":
          "The effective surface area of a typical wound core available to dissipate heat.",
    },
    {
      "id": 1,
      "word": "Surface Resistance",
      "def":
          "The ratio of the direct current applied to an insulation system to the current that passes across the surface of the system.",
    },
    {
      "id": 1,
      "word": "surface-mount device",
      "def":
          "An electronic component, ranging from discrete passive components to VLSI chips, attached to the surface of a printed circuit board, either directly or through a surface-mount connector, rather than by means of holes in the board.",
    },
    {
      "id": 1,
      "word": "surge",
      "def":
          "A transient variation in the current and/or potential at a point in the circuit.",
    },
    {
      "id": 1,
      "word": "SV",
      "def": "Space Vehicle",
    },
    {
      "id": 1,
      "word": "swedging",
      "def": "Another term for crimping.",
    },
    {
      "id": 1,
      "word": "Swing",
      "def":
          "A term used to describe how inductance responds to changes in current, ie a 2:1 swing corresponds to an inductor which exhibits two times more inductance at very low current than it does at its maximum rated current. This would also correspond to the core operating at 50% of initial permeability (50% saturation).",
    },
    {
      "id": 1,
      "word": "Swinging Inductors",
      "def":
          "A special type of inductor that exhibits high inductance at low MMF and moderate inductance at high MMF. There are two popular techniques for accomplishing this: placing a common winding on a high permeability core and a low permeability core, and placing a staggered gap into a high permeability core.",
    },
    {
      "id": 1,
      "word": "Switch",
      "def":
          "(1) A mechanical or electronic device used to make or break an electrical circuit. (2) An N-port device that directs energy from one port to another or interrupts the flow of energy. A switch can use mechanical, electromechanical or electronic switching elements. (3) A type of network hub. Provides higher bandwidth than shared hubs.",
    },
    {
      "id": 1,
      "word": "Switch Mode Power Supply",
      "def":
          "A power conversion technique that involves breaking the input power into pulses at a high frequency by switching it on and off and re-combining these pulses at the output stage. Using this technique, an unregulated input voltage can be converted to one or more regulated output voltages at relatively high efficiencies.",
    },
    {
      "id": 1,
      "word": "Switched Virtual Circuit",
      "def":
          "SVC - A virtual link, with variable end-points, established through an ATM network. With an SVC, the user defines the end-points when the call is initiated that are subsequently terminated at the end of the call. With a Permanent Virtual Circuit(PVC), the end-points are predefined by the network manager. A single virtual path may support multiple.",
    },
    {
      "id": 1,
      "word": "Switching Frequency",
      "def":
          "The rate at which the DC input to a switching regulator is switched on and off.",
    },
    {
      "id": 1,
      "word": "Switching Regulator",
      "def":
          "A circuit that is designed to regulate the output voltage, from a given input voltage, by using a closed control loop design. The most common switching regulator types involve a magnetic component, such as an inductor or transformer, that is used to store and transfer energy to the output by having the current switched on and off (Also see Boost Regulator and Buck Regulator)",
    },
    {
      "id": 1,
      "word": "Switching Time",
      "def":
          "The time required for the output of a switch to attain 90 percent of its steady-state level referenced to the 50 percent level of the command signal.",
    },
    {
      "id": 1,
      "word": "SWR",
      "def":
          "Standing Wave Ratio - The ratio between maximum and minimum current, or voltage, along a line. It is a measure of the mismatch between the load and the line, and is equal to 1 when the line impedance is perfectly matched to the load. (In that case the maximum and minimum are the same, as current and voltage do not vary along the line.) The perfect match would be referred to as a 1 to 1 ratio. Vswr is voltage standing wave ratio.",
    },
    {
      "id": 1,
      "word": "Symmetrical Transmission",
      "def":
          "Transmission in which a channel sends and receives data with the same signaling rate.",
    },
    {
      "id": 1,
      "word": "synchronize",
      "def":
          "Make sure that the level or pulse is presented to the system, or subsystem, at the correct time.",
    },
    {
      "id": 1,
      "word": "synchronizer",
      "def":
          "A computer storage device used to compensate for difference in rate of flow of information, or time of occurrence of events, when transmitting information from one device to another.",
    },
    {
      "id": 1,
      "word": "synchronous",
      "def":
          "A device or system in which all events occur in a predetermined timed sequence. Usually all parts operate to a common clock. See also asynchronous.",
    },
    {
      "id": 1,
      "word": "synchronous generator",
      "def":
          "An alternator (ac generator); a synchronous alternating-current device which transforms mechanical power into electrical energy.",
    },
    {
      "id": 1,
      "word": "synchronous transmission",
      "def":
          "Transmission in which the data characters and bits are transmitted at a fixed rate with the transmitter and receiver synchronized.",
    },
    {
      "id": 1,
      "word": "system",
      "def":
          "An assembly of components united by some form of regulated interaction to function as an entity.",
    },
    {
      "id": 1,
      "word": "System Damage Voltage",
      "def":
          "Maximum voltage across a SiBar device at breakdown measured under a specified voltage rate of rise and current rate of rise.",
    },
    {
      "id": 1,
      "word": "System/3X (IBM)",
      "def": "The predecessor of the AS/400.",
    },
    {
      "id": 1,
      "word": "T rise",
      "def":
          "Change in temperature of a terminal from a no-load condition to full-current load.",
    },
    {
      "id": 1,
      "word": "T1",
      "def":
          "Digital transmission facility operating with a nominal bandwidth of 1.544 Mbps. Also known as Digital Signal Level 1 (D1). Composed of 24 DS-0 channels in many cases. The T1 digital transmission system if the primary digital communication system in North America.",
    },
    {
      "id": 1,
      "word": "T2L",
      "def":
          "Transistor Transistor Logic. A popular bipolar logic family based on a multiple-emitter transistor. Compared to MOS logic, TTL is generally faster, although it uses more power and offers less packaging density. See also Schottky TTL. Also called TTL",
    },
    {
      "id": 1,
      "word": "T3",
      "def":
          "Digital transmision facility operating at 45 Mbps bandwidth. Composed of 28 DS-1 channels in many cases. Also known as DS-3.",
    },
    {
      "id": 1,
      "word": "T568A and B",
      "def": "The two standard wiring patterns for 8-position modular jacks.",
    },
    {
      "id": 1,
      "word": "tab",
      "def":
          "Used to describe the flat blade portion of certain terminals (eg a FASTON* tab, a taper tab, a solder tab). Also, on strip terminals, is used to describe the projection which results when the point-of-shear is not flush with the terminal body (ie cutoff tab).",
    },
    {
      "id": 1,
      "word": "table",
      "def":
          "A collection of data in tabular form (usually in parallel rows or columns for ready reference), with each item being uniquely identified by some label or by its relative position. See also truth table.",
    },
    {
      "id": 1,
      "word": "Tab-Lok crimp",
      "def":
          "A type of crimp used on FASTON flag terminals whereby a tab on the wire barrel is inserted through a slot in the terminal. The crimping action flattens the tab between two lances, which in turn are locked over the tab.",
    },
    {
      "id": 1,
      "word": "tactile feedback",
      "def": "The feel or snap action of certain constructions of keyboards.",
    },
    {
      "id": 1,
      "word": "tap (network)",
      "def":
          "The means of connecting a piece of equipment to the transmission media of a network.",
    },
    {
      "id": 1,
      "word": "Tap loss",
      "def":
          "In a fiber-optic coupler, the ratio of power at the tap port to the power at the input port.",
    },
    {
      "id": 1,
      "word": "Tap port",
      "def":
          "In a coupler in which the splitting ratio between output ports is not equal, the output port containing the lesser power.",
    },
    {
      "id": 1,
      "word": "tape memory",
      "def":
          "A serial, bulk-storage, off-line memory medium consisting of metal, paper, or plastic tape coated with magnetic material. Information is stored as small magnetized spots, usually arranged in columns across the width of the tape, with each column representing a tape character. A read-write head is usually associated with each row of magnetized spots so that one column can be read or written at a time as the tape is moved relative to the head. Paper tape in which data is stored in form of punched holes, as in numerically controlled machinery and teletype equipment, is also considered tape memory.",
    },
    {
      "id": 1,
      "word": "Tape Wound Core",
      "def":
          "Cores made by rolling strips of alloy iron into a toroidal shape. The metal strips have a precisely controlled thickness which are coted with a very thin insulation material to prevent the metal in the layers to make contact with each other. The finished cores have an outside coating to protect the metal layers and they are offered in a variety of material mixes. Tape wound cores are capable of storing high amounts of energy and contain a high permeability. Their major disadvantage is that they are relatively expensive when compared to other core types (Also see Toroidal Inductor)",
    },
    {
      "id": 1,
      "word": "Tape Wound Cores",
      "def":
          "Cores made by rolling strips of alloy iron into a toroidal shape. The metal strips have a precisely controlled thickness, which are coated with a very thin insulating material to prevent the metal in the layers to make contact with each other. The finished cores have an outside coating to protect the metal layers and they are offered in a variety of material mixes. Tape wound cores are capable of storing high amounts of energy and contain a high permeability. Their major disadvantage is that they are relatively expensive when compared to other core types.",
    },
    {
      "id": 1,
      "word": "Tape Wrap",
      "def":
          "A term denoting a spirally or longitudinally applied tape material wrapped around insulated or uninsulated wire and used as a mechanical barrier.",
    },
    {
      "id": 1,
      "word": "tape-mounted",
      "def":
          "Screw-machine or pre-insulated terminals (or contacts) that are produced in loose-piece form and then inserted into plastic pockets in continuous lengths, and placed on reels, for application in automatic or semi automatic machines.",
    },
    {
      "id": 1,
      "word": "taper pin",
      "def":
          "A small conical shaped electrical contact that utilizes the Morse taper principle to effect a strong mechanical connection after being impacted into a receptacle of corresponding geometric form.",
    },
    {
      "id": 1,
      "word": "target area",
      "def":
          "A term used to indicate the relationship of the three axes (lateral, vertical, and axial) of terminal with the crimp tooling. The point at which all three axes coincide is called the target area.",
    },
    {
      "id": 1,
      "word": "TC",
      "def":
          "(1) Tinned copper; (2) Temperature Coefficient - A factor used to calculate the change in the characteristics of a substance, device, or circuit element with changes in its temperature. The values are usually expressed as a percentage per degree Celsius. Applies to the change in capacitance or resistance of any electronic part or element per degree change in temperature.",
    },
    {
      "id": 1,
      "word": "tcr",
      "def": "Temperature coefficient of resistance.",
    },
    {
      "id": 1,
      "word": "TDM",
      "def": "Time-division multiplexing.",
    },
    {
      "id": 1,
      "word": "TDMA",
      "def":
          "Time division multiple access. A transmission in which a frequency band is split into a number of time slots so that several callers can share a single channel without interfering with each other. The term TDMA is commonly used to denote the IS -136 air interface standard, formerly known as D-AMPS.",
    },
    {
      "id": 1,
      "word": "TDMA",
      "def": "Time Division Multiple Access. (See also CDMA)",
    },
    {
      "id": 1,
      "word": "TDOP",
      "def": "Time clock offset",
    },
    {
      "id": 1,
      "word": "Tear Test",
      "def":
          "A test to determine the tear strength of an insulating material. Usually includes exposure to given thermal conditions or a programmed series of conditions for prescribed periods of time.",
    },
    {
      "id": 1,
      "word": "Technischer Uberwachungs-Verin (TUV)",
      "def":
          "Organization approved for testing products to VDE standards. US-based companies often use TUV in place of VDE because they hae established facilities in the US.",
    },
    {
      "id": 1,
      "word": "Tee coupler",
      "def": "A three-port optical coupler.",
    },
    {
      "id": 1,
      "word": "Telco",
      "def": "Short for telecommunications (or telephone company).",
    },
    {
      "id": 1,
      "word": "Telco connector",
      "def": "Refers to a 25-pair (AMP CHAMP) connector.",
    },
    {
      "id": 1,
      "word": "Telecom closet",
      "def":
          "Telecommunications closet. The area of the building that houses the termination of the horizontal cabling.May also contain LAN electronics. Also called wiring closet",
    },
    {
      "id": 1,
      "word": "telecommunication",
      "def":
          "Any process that enables a correspondent to pass to one or more given correspondents (telegraphy or telephony), or possible correspondents (broadcasting), information of any nature delivered in any usable form (written or printed matter, fixed or moving, pictures, words, music, visible or audible signals, signals controlling the functioning of mechanisms, etc) by means of any electromagnetic system (electrical transmission by wire, radio transmission, optical transmission, etc, or a combination of such systems).",
    },
    {
      "id": 1,
      "word": "Telecommunications Transformers",
      "def":
          "Also referred to as broadband transformers, these are transformers specialized for connecting a piece of equipment to the phone line or telephone network. Its function is to isolate the equipment from the phone line, improve common mode noise rejection, and match different impedances.",
    },
    {
      "id": 1,
      "word": "Telecommuter",
      "def":
          "Person who performs work at home while linked to the office by means of a telecommunications-equipped computer system.",
    },
    {
      "id": 1,
      "word": "telpak",
      "def":
          "A high-speed telephone or broadband service. Telpak has the wide band channels necessary for computer-to-computer communication and other special high-speed applications. There are presently four sizes of telpak available: Telpak A - Equivalent in capacity to 12-voice circuits.; Telpak B - Equivalent in capacity to 24-voice circuits.; Telpak C - Equivalent in capacity to 60-voice circuits.; Telpak D - Equivalent in capacity to 240-voice circuits.",
    },
    {
      "id": 1,
      "word": "temperature coefficient",
      "def":
          "TC - A factor used to calculate the change in the characteristics of a substance, device, or circuit element with changes in its temperature. The values are usually expressed as a percentage per degree Celsius. Applies to the change in capacitance or resistance of any electronic part or element per degree change in temperature.",
    },
    {
      "id": 1,
      "word": "Temperature Coefficient Of Inductance",
      "def":
          "(Tc of L)Is the value of inductance change as a function of temperature exposure, normally expressed in parts per million per degrees Celsius. This is a calculation comparing inductance at a reference temperature (25 degrees C, room ambient) to the extremes and other temperatures within operating range. Can be called Percent Delta L. or Temperature Stability: the lower the change the better for most applications.",
    },
    {
      "id": 1,
      "word": "temperature coefficient of linear expansion",
      "def":
          "The amount of change in any linear dimension of a solid arising from a change in temperature. Usually measured in microinches per inch per degree Celsius. When crimping two metals with dissimilar coefficients, ie, aluminum wire in a copper terminal wire barrel, special considerations must be included in the terminal design to prevent deterioration from 'creep.' See also creep.",
    },
    {
      "id": 1,
      "word": "Temperature Factor (TF)",
      "def":
          "The fractional change in initial permeability over a temperature range divided by the initial permeability.",
    },
    {
      "id": 1,
      "word": "Temperature Range",
      "def":
          "The ambient temperature range of the air (or other medium) surrounding a PolySwitch device under normal operating conditions.",
    },
    {
      "id": 1,
      "word": "Temperature Rating",
      "def":
          "The maximum temperature at which the insulating material may be used in continuous operation without loss of its basic properties. Usually time dependent.",
    },
    {
      "id": 1,
      "word": "temperature rise",
      "def":
          "(1) Change in temperature of a terminal from a no-load condition to full-current load. Also called T rise. (2) The increase in surface temperature of a component in air due to the power dissipation in the component. The power dissipation for an inductor includes both copper and core losses.",
    },
    {
      "id": 1,
      "word": "Tempest",
      "def":
          "A classified Department of Defense program to provide secure electronic equipment through extensive EMC techniques.",
    },
    {
      "id": 1,
      "word": "tensile",
      "def":
          "The amount of axial load (longitudinal stress) required to break or pull the wire from the crimped barrel of a terminal, splice, or contact. Also called 'pull test.'",
    },
    {
      "id": 1,
      "word": "tensile strength",
      "def":
          "The greatest longitudinal stress that a substance (union) can bear without tearing (pulling) apart. In crimped terminations: the greatest longitudinal stress that the termination can bear without the wire and terminal separating.",
    },
    {
      "id": 1,
      "word": "tera",
      "def": "A prefix indicating 1012, a trillion, abbreviated 'T.'",
    },
    {
      "id": 1,
      "word": "Terahertz",
      "def":
          "A frequency of, or a frequency in the range of a trillion hertz. Abbreviated THz.",
    },
    {
      "id": 1,
      "word": "Terapin",
      "def": "A trillion pins.",
    },
    {
      "id": 1,
      "word": "Termal Conductivity",
      "def":
          "Given materials ability to conduct heat, which is the time rate for heat transfer (via conduction) across a unit material thickness of 1 meter and when the temperature differential of the two opposite faces is 1 degree K.",
    },
    {
      "id": 1,
      "word": "terminal",
      "def":
          "An electrically conductive item designed to be attached to a circuit or device for convenience in making electrical connections.",
    },
    {
      "id": 1,
      "word": "terminal area",
      "def":
          "The portion of a printed circuit - usually along the edge - used for making the input-output connections. Sometimes this term is used synonymously with pad. See also land, and pad.",
    },
    {
      "id": 1,
      "word": "terminal barrel",
      "def": "See barrel.",
    },
    {
      "id": 1,
      "word": "terminal strip",
      "def":
          "An insulated mounting for terminal connections. Terminal strips are available with threaded holes to accept threaded screws, or with threaded studs to accept fastening washers and nuts. If the terminal areas are separated by an insulating barrier, the terminal strips are called barrier blocks.",
    },
    {
      "id": 1,
      "word": "Termination",
      "def": "A one port component that terminates a transmission line.",
    },
    {
      "id": 1,
      "word": "terminus",
      "def": "A part of a fiber-optic connector analagous to a contact.",
    },
    {
      "id": 1,
      "word": "terpolymer",
      "def": "A resin formed by three separate monomers polymerized together.",
    },
    {
      "id": 1,
      "word": "Tesla",
      "def":
          "The MKSA (SI) unit for magnetic flux density, defined by Faraday's Law. A Tesla represents a volt-second per square meter per turn. One Tesla is equal to 10,000 Gauss.",
    },
    {
      "id": 1,
      "word": "Test Frequency",
      "def":
          "Is the industry/military standard for testing a range of inductances. It is not intended as the application frequency. Expressed in megahertz (MHz) or kilohertz (KHz)",
    },
    {
      "id": 1,
      "word": "TETRA-CRIMP tools",
      "def":
          "Exclusive AMP designed tooling featuring a trapezoidal crimp configuration which will crimp PIDG and PLASTI-GRIP terminals and splices, as well as PIDG and PLASTI-GRIP FASTON receptacles all in the same tool. Includes hand tool, crimping dies, and applicators.",
    },
    {
      "id": 1,
      "word": "thermal compression bond",
      "def":
          "The joining of metals by the combined effects of temperature and pressure.",
    },
    {
      "id": 1,
      "word": "Thermal Conductivity",
      "def":
          "Given materials ability to conduct heat, which is the time rate for heat transfer (via conduction) across a unit material thickness of 1 meter and when the temperature differential of the two opposite faces is 1 degree K.",
    },
    {
      "id": 1,
      "word": "Thermal Derating",
      "def":
          "The change in the hold current and trip current of a PolySwitch device that takes place as there is a change in the ambient temperature of the air (or other medium) surrounding the device. An increase in ambient temperature decreases the hold current (and the trip current). A decrease in ambient temperature increases the trip current (and the hold current).",
    },
    {
      "id": 1,
      "word": "thermal expansion",
      "def":
          "The fractional change in length (sometimes volume) of a material for a unit of change in temperature.",
    },
    {
      "id": 1,
      "word": "Thermal Gasket",
      "def":
          "Flexible pad or wafer with a very low thermal resistance that is put between a power module baseplate and heat sink to ensure high thermal conductivity across the junction",
    },
    {
      "id": 1,
      "word": "Thermal Joint Compound",
      "def":
          "A fluid or paste spread between the mating surfaces of a power device baseplate and a heat sink or system chassis.",
    },
    {
      "id": 1,
      "word": "Thermal noise",
      "def":
          "Noise resulting from thermally induced random fluctuation in current in the receiver's load resistance.",
    },
    {
      "id": 1,
      "word": "Thermal Protection",
      "def":
          "Feature that shuts the converter down if the internal tempurature exceeds preset limits. Also called thermal shutdown.",
    },
    {
      "id": 1,
      "word": "Thermal Rating",
      "def":
          "The effect of heat or cold applied at such a rate that nonuniform thermal expansion or contraction occurs within a given material or combination of materials. In electrical terminations, the effect can cause inserts and other insulation material to pull away from the metal parts.",
    },
    {
      "id": 1,
      "word": "thermal rating",
      "def":
          "The maximum and/or minimum temperature at which a material will perform its function without undue degradation.",
    },
    {
      "id": 1,
      "word": "Thermal Resistance",
      "def":
          "The property of a material, device or system that impedes the flow of heat. The symbol for thermal impedance is Qxy , where x is the physical point from which heat flows and y is the physical point to which heat flows. Thermal impedance is defined as the temperature difference between two specified points or regions divided by the power dissipation under conditions of thermal equilibrium.",
    },
    {
      "id": 1,
      "word": "Thermal Resistivity",
      "def":
          "Measure of a material;s ability to impede the flow of heat. Typically given in degrees C T/W, where T is the material thickness and W is the power flowing through the material in watts.",
    },
    {
      "id": 1,
      "word": "thermal shock",
      "def":
          "The effect of heat or cold applied at such a rate that nonuniform thermal expansion or contraction occurs within a given material or combination of materials. The effect can cause inserts and other insulation materials to pull away from metal parts.",
    },
    {
      "id": 1,
      "word": "Thermal Shock Test",
      "def":
          "A test in which the resistance of a PolySwitch device at room temperature is measured before and after a temperature cycling treatment (e.g., cycled 10 times between ?55?C and +125?C).",
    },
    {
      "id": 1,
      "word": "thermal timedelay switch",
      "def":
          "An overcurrent-protective device containing a heater element and thermal delay.",
    },
    {
      "id": 1,
      "word": "Thermochromic Indicator",
      "def":
          "Special compound that changes color when the proper wetting temperature has been reached in the solder joint.",
    },
    {
      "id": 1,
      "word": "Thermoplastic",
      "def":
          "A material that softens (melts and flows) when heated and becomes firm when cooled. A type of plastic that can be remelted a number of times without any important change in properties. Nylon, GE?s Lexan, and PVC?examples of this type of plastic?are resilient after molding.",
    },
    {
      "id": 1,
      "word": "thermoplastic elastomer",
      "def":
          "tpe - A jacket material which has many of the characteristics of rubber, as well as excellent electrical, mechanical, and chemical properties.",
    },
    {
      "id": 1,
      "word": "Thermoset",
      "def":
          "A material that hardens or sets when heated and, once set, cannot be resoftened by heating. This application of heat is called ?curing.?",
    },
    {
      "id": 1,
      "word": "Thermosetting Adhesive",
      "def":
          "A curing adhesive that requires heat to promote curing. This type of plastic will not soften when reheated. See Epoxy.",
    },
    {
      "id": 1,
      "word": "Thermosetting plastic",
      "def":
          "A type of plastic in which an irreversible chemical reaction takes place while it is being molded under heat and pressure. This type of plastic cannot be reheated or softened. Phenolic and diallyl phthalate are examples of thermosetting plastics.",
    },
    {
      "id": 1,
      "word": "Thick Film",
      "def": "A film of material that was silk-screened onto a substrate.",
    },
    {
      "id": 1,
      "word": "thick film circuit",
      "def":
          "A circuit fabricated by deposition of materials forming passive components and conductors to an approximate thickness 0.05 mils on a nonconducting substrate (generally alumina or beryllia).",
    },
    {
      "id": 1,
      "word": "Thicknet",
      "def": "IEEE 10BASE5.10 Mbps Ethernet on thick coaxial cable.",
    },
    {
      "id": 1,
      "word": "Thin Film",
      "def":
          "A film of material, ranging in thickness from a few hundred to a few thousand Angstroms, which is deposited by evaporation onto a substrate.",
    },
    {
      "id": 1,
      "word": "thin film circuit",
      "def":
          "A circuit fabricated by deposition of materials in a vacuum to form passive components and conductors to a thickness of several hundred angstroms on an insulating substrate.",
    },
    {
      "id": 1,
      "word": "Thinnet",
      "def": "IEEE 10BASE2. 10 Mbps Ethernet on thin (RG58) coaxial cable.",
    },
    {
      "id": 1,
      "word": "Three-Terminal Regulator",
      "def":
          "Regulator packaged in a standard 3-terminal transistor package. These devices can be a switching type or a linear shunt or series regulator.",
    },
    {
      "id": 1,
      "word": "Throughput loss",
      "def":
          "In a fiber-optic coupler, the ratio of power at the throughput port to the power at the input port.",
    },
    {
      "id": 1,
      "word": "Throughput port",
      "def":
          "In a coupler in which the splitting ratio between output ports is not equal, the ouput port containing the greater power.",
    },
    {
      "id": 1,
      "word": "Thyristor",
      "def":
          "Commonly used to protect telecom equipment, data transmission lines and signal lines, Thyristor devices fold back from high to low resistance when responding to a voltage surge.",
    },
    {
      "id": 1,
      "word": "time-delay",
      "def":
          "A circuit that delays the transmission of an impulse a definite and desired period of time.",
    },
    {
      "id": 1,
      "word": "time-delay relay",
      "def":
          "A relay in which the energizing or deenergizing of the coil precedes movement of the armature by an appreciable - and generally determinable - interval.",
    },
    {
      "id": 1,
      "word": "time-delay switch",
      "def":
          "A switch having contacts which control a load circuit and are delayed from operating for a predetermined time interval.",
    },
    {
      "id": 1,
      "word": "time-division multiplexing",
      "def":
          "A technique used in data communications technique for combining several lower speed channels into one transmission path at higher speed in which each low-speed channel is allotted a specific position based upon time in the signal stream.",
    },
    {
      "id": 1,
      "word": "timeshare",
      "def": "To use a device for two or more interleaved purposes.",
    },
    {
      "id": 1,
      "word": "Time-to-Trip",
      "def":
          "The time needed, from the onset of a fault current, to trip a PolySwitch device. For any particular type of PolySwitch device, trip time depends upon the size of the fault current and the ambient temperature. The higher the fault current and/or the higher the temperature, the shorter the trip time.",
    },
    {
      "id": 1,
      "word": "tinning",
      "def":
          "A hot dip process for the application of solder coating on conductors and terminals primarily for minimizing in-process oxidation and enhancing solderability.",
    },
    {
      "id": 1,
      "word": "TNC Series connector",
      "def":
          "A radio frequency connector covered by Military Specification. It has an impedance of 50 ohms and is designed to operate in the 0 to 11 GHz frequency range. Reliability is assured by a threaded coupling that can be safety wired to prevent accidental disconnect.",
    },
    {
      "id": 1,
      "word": "TO can",
      "def":
          "Transistor outline. A standard system for specifying the dimensions of a transistor package. Each different package is given a number: TO-5, TO-18, TO-52, etc.",
    },
    {
      "id": 1,
      "word": "Token ring",
      "def": "A networking protocol based on a token-passing ring.",
    },
    {
      "id": 1,
      "word": "Tolerance",
      "def":
          "The total amount by which a quantity is allowed to vary from nominal; thus, the tolerance is half the algebraic difference between the maximum and minimum limits.",
    },
    {
      "id": 1,
      "word": "tone-encoded keyboard",
      "def":
          "A keyboard encoded in rows and columns designed to be the same as those used in telephones.",
    },
    {
      "id": 1,
      "word": "Toroid",
      "def":
          "A core that has a donut shaped surface. Toroidal cores are available in many magnetic core materials. Characteristics of toroidal inductors include self-shielding due to a closed magnetic path, efficient energy transfer, high coupling between windings, and early saturation. The toroidal core gives a maximum magnetic field within itself, with minimum magnetic flux leakage externally.",
    },
    {
      "id": 1,
      "word": "Toroidal Inductor",
      "def":
          "An inductor constructed by placing a winding(s) on a core that has a donut shaped surface. Toroidal cores are available in many magnetic core materials within the four basic types: Ferrite, Powdered iron, Alloy and High Flux, and Tape Wound. Characteristics of toroidal inductors include: self shielding (closed magnetic path), efficient energy transfer, high coupling between windings and early saturation.",
    },
    {
      "id": 1,
      "word": "Trace Capacitance",
      "def": "The capacitance between trace to reference plane",
    },
    {
      "id": 1,
      "word": "Traceability",
      "def":
          "The ability to trace the history, application, or location of an item and like items or activities by means of recorded identification. The lot number/manufacturing order (MO) number, or SMO number used to identify items or groups of items is traceable back to inspection and procurement records.",
    },
    {
      "id": 1,
      "word": "track",
      "def":
          "The portion of a moving storage medium, such as a drum, tape, disc, or card, that contains the encoded data.",
    },
    {
      "id": 1,
      "word": "tracking",
      "def":
          "The action of a high voltage current creating a leakage or fault path across the surface of insulation by steadily forming a carbonized thin line between electrodes.",
    },
    {
      "id": 1,
      "word": "Tracking",
      "def":
          "For a multiple output converter the parameter that gives the change in one output voltage caused by a change in the voltage level or load on another output.",
    },
    {
      "id": 1,
      "word": "transfer molding",
      "def":
          "A method of molding thermosetting materials, in which the plastic is first softened by heat and pressure in a transfer chamber, and then forced into a closed mold for final curing.",
    },
    {
      "id": 1,
      "word": "Transformer",
      "def":
          "A passive device that changes voltage, current, or impedance to the required parameters. This is usually done by placing two or more windings around a soft magnetic core. Applying a voltage to the primary winding will produce a magnetic field in the core, and in turn induce a voltage in the secondary winding(s).",
    },
    {
      "id": 1,
      "word": "Transient",
      "def":
          "Spike or step change in a converter paramenter. Commonly used in describing input line and output load characteristics.",
    },
    {
      "id": 1,
      "word": "Transient Recovery Time",
      "def":
          "Time required for a converter output to return to within specified limits following a step change in output load current. Expressed as a percentage of rated value.",
    },
    {
      "id": 1,
      "word": "Transient Suppression",
      "def":
          "The use of special devices to minimize the effects of transients in electronic circuits. Transient suppression devices include the metal oxide varistor (MOV), semiconductor transient voltage suppressor (TVS) and gas tube.",
    },
    {
      "id": 1,
      "word": "transients",
      "def":
          "Undesirable voltage and current surges that are usually caused by capacitive or inductive energy discharges in electrical circuits.",
    },
    {
      "id": 1,
      "word": "transistance",
      "def":
          "An electronic characteristic exhibited in the form of voltage or current gain, or in the ability to control voltages or currents in a precise nonlinear manner. Transistors, diodes, and vacuum tubes are examples of components which show transistance.",
    },
    {
      "id": 1,
      "word": "transistor",
      "def":
          "An active solid-state semiconductor device with three or more electrodes and capable of amplification, rectification, and switching. Important features are low power, small size, and long life. Two main types are bipolar and field effect.",
    },
    {
      "id": 1,
      "word": "Transition Time",
      "def":
          "The time required for a varactor or step recovery diode to change from the conducting to non-conducting state after reverse bias is applied, excluding the time required for charge to be conducted from the junction. It is normally measured from the 90 percent to 10 percent reverse current states. Transition time is also called 'snap time.'",
    },
    {
      "id": 1,
      "word": "Transmission Cable",
      "def":
          "Two or more transmission lines. If the structure is flat, it is sometimes called flat transmission cable to differentiate it from a round structure such as a jacketed group of coaxial cables. See also Transmission Line.",
    },
    {
      "id": 1,
      "word": "Transmission Control Protocol/Internet Protocol (TCP/IP)",
      "def":
          "A reliable, full duplex, connection-oriented end to end transport protocol running on top of IP.",
    },
    {
      "id": 1,
      "word": "Transmission Line",
      "def":
          "A signal-carrying circuit with controlled electrical characteristics; used to transmit high-frequency or narrowpulse signals.",
    },
    {
      "id": 1,
      "word": "Transparent LAN Service",
      "def":
          "Service offered by a provider that is used to connect LANs at geographically separated sites. 'Transparent' means the connection is invisible to the user and typically runs at the same speed as the LANs.",
    },
    {
      "id": 1,
      "word": "TRAPATT",
      "def": "TRApped Plasma Avalanche Transit Time.",
    },
    {
      "id": 1,
      "word": "TRI",
      "def": "telephony return interface",
    },
    {
      "id": 1,
      "word": "triac",
      "def":
          "A multilayer semiconductor device designed for ac power supply applications. It presents an open circuit between its two power terminals to ac until it is triggered on. It then has a low forward voltage drop like an SCR. The triggering pulse, applied to the triggering terminal, can be of either polarity during either half cycle of applied voltage. Planar triacs have been fabricated.",
    },
    {
      "id": 1,
      "word": "Triaxial Cable",
      "def":
          "A concentrically constructed cable, with a common axis, composed of a center connector, first shield, and second shield, all insulated from each other.",
    },
    {
      "id": 1,
      "word": "trimming",
      "def":
          "The adjustment of resistor or capacitor values in thick or thin film circuits by pattern changes, irreversible thermally induced changes, or removal of portions of material by laser or abrasive techniques. Dynamic trim is unique to these technologies, and of great value to circuit design and manufacture.",
    },
    {
      "id": 1,
      "word": "Trip",
      "def":
          "Switching of a PolySwitch device from a low resistance to a high resistance. In its low-resistance state, the device permits normal currents to flow in a circuit. Occurrence of a fault drives the device to its high-resistance (or 'tripped') state, and this reduces the current in the circuit to a low level.",
    },
    {
      "id": 1,
      "word": "Trip Current",
      "def":
          "The smallest steady state current that, if passed through a PolySwitch device, will cause the device to trip, under specified conditions.",
    },
    {
      "id": 1,
      "word": "Trip Cycle",
      "def":
          "The tripping and resetting of a PolySwitch device under specified conditions.",
    },
    {
      "id": 1,
      "word": "Trip Cycle Life",
      "def":
          "The number of trip cycles that a PolySwitch device will undergo without failure, with failure being defined in a specified way.",
    },
    {
      "id": 1,
      "word": "Trip Time",
      "def":
          "The time needed, from the onset of a fault current, to trip a PolySwitch device. For any particular type of PolySwitch device, trip time depends upon the size of the fault current and the ambient temperature. The higher the fault current and/or the higher the temperature, the shorter the trip time.",
    },
    {
      "id": 1,
      "word": "Tri-State",
      "def": "Tri-State buffer is a buffer that can be either input or output",
    },
    {
      "id": 1,
      "word": "TRK",
      "def":
          "Track. Direction of travel relative to a ground position (same as Course Over Ground)",
    },
    {
      "id": 1,
      "word": "TRN",
      "def":
          "Turn. The degrees which must be added to or subtracted from the current heading to reach the course to the intended waypoint.",
    },
    {
      "id": 1,
      "word": "truth table",
      "def":
          "A table that defines a logic function by listing all combinations of input values, and indicating for each combination the true output values.",
    },
    {
      "id": 1,
      "word": "TTFF",
      "def": "Time to First Fix",
    },
    {
      "id": 1,
      "word": "TTL",
      "def":
          "Transistor-transistor logic. A popular bipolar logic family based on a multiple-emitter transistor. Compared to MOS logic, TTL is generally faster, although it uses more power and offers less packaging density. See also Schottky TTL. Also called T2L",
    },
    {
      "id": 1,
      "word": "TtT",
      "def":
          "The time needed, from the onset of a fault current, to trip a PolySwitch device. For any particular type of PolySwitch device, trip time depends upon the size of the fault current and the ambient temperature. The higher the fault current and/or the higher the temperature, the shorter the trip time.",
    },
    {
      "id": 1,
      "word": "Tuning Monotonicity",
      "def":
          "The degree to which the sign of the slope of the tuning response versus stimulus curve of a device does not change.",
    },
    {
      "id": 1,
      "word": "Tunnel Diode",
      "def":
          "A heavily doped p-n diode in which electron tunneling from the conduction band in the n-type material to the valence band in the p-type region produces a region of negative resistance. Tunnel diodes may be used as oscillators, amplifiers or detectors (M/A-COM does not manufacture tunnel diodes).",
    },
    {
      "id": 1,
      "word": "Turn Ratio",
      "def":
          "The ratio of the primary voltage (or turns) to the secondary voltage (or turns)",
    },
    {
      "id": 1,
      "word": "Twisted Pair",
      "def":
          "Cable consisting of two 18 to 24 AWG (American Wire Gauge) solid copper strands twisted around each other. The twisting provides a measure of protection from electromagnetic and radio-frequency interference.",
    },
    {
      "id": 1,
      "word": "Twisted pair cable",
      "def": "Cable made from pairs of wires which have been twisted together.",
    },
    {
      "id": 1,
      "word": "two-piece connector",
      "def":
          "A board-to-board connector in which part of the connector is attached to each board.",
    },
    {
      "id": 1,
      "word": "two-piece contact",
      "def": "(contact) See contact, two-piece.",
    },
    {
      "id": 1,
      "word": "Two-tone Third-Order Intermodulation Distortion",
      "def":
          "The intermodulation distortion products produced by a component or system when two distinct signals at frequencies f1 and f2 are incident on the device. The third order products are defined as 2*f1-f2 and 2*f2 - f1. These products fall very near the original frequencies and are difficult or impossible to remove by filtering, so they are most troublesome to the operation of the system or component.",
    },
    {
      "id": 1,
      "word": "UADSL",
      "def": "universal ADSL",
    },
    {
      "id": 1,
      "word": "UDP",
      "def": "user datagram protocol",
    },
    {
      "id": 1,
      "word": "UG",
      "def":
          "Used to describe coaxial connectors that are made to a Government Specification.",
    },
    {
      "id": 1,
      "word": "uhf",
      "def":
          "Ultra High Frequency - A Federal Communications Commission designation for the band from 300 to 3000 MHz on the radio spectrum. In television, channels 14 to 83, or 470 to 890 MHz.",
    },
    {
      "id": 1,
      "word": "UL",
      "def":
          "Underwriters' Laboratories, Inc. An independent laboratory that tests equipment to determine whether it meets certain safety standards when properly used.",
    },
    {
      "id": 1,
      "word": "ultrahigh frequency",
      "def":
          "UHF - A Federal Communications Commission designation for the band from 300 to 3000 MHz on the radio spectrum. In television, channels 14 to 83, or 470 to 890 MHz.",
    },
    {
      "id": 1,
      "word": "ultrasonic bond",
      "def":
          "A joining of materials achieved by the scrubbing action and energy transfer of a tool vibrating at an ultrasonic frequency. Attaching leads to pads on silicon devices, and achieving bonds between dissimilar metals are two common applications of this process. See also ultrasonic welding.",
    },
    {
      "id": 1,
      "word": "ultrasonic welding",
      "def":
          "Process using vibratory mechanical pressure at ultrasonic frequencies (20 to 40 kHz) to provide heat for welding some types of thermoplastics. See also ultrasonic bond.",
    },
    {
      "id": 1,
      "word": "ultraviolet curing",
      "def":
          "Process of accomplishing complete cross-linkage of a polymer coating or other product using ultraviolet light on the work piece.",
    },
    {
      "id": 1,
      "word": "Ultraviolet Degradation",
      "def":
          "The degradation caused by long-time exposure of a material to sunlight or other ultraviolet rays.",
    },
    {
      "id": 1,
      "word": "umbilical connector",
      "def":
          "Used to connect ground support cables to a rocket or missile, and is then disconnected from the missile at the time of launching.",
    },
    {
      "id": 1,
      "word": "UMTS",
      "def":
          "Universal mobile telecommunications system. The name of the third-generation mobile phone standard promoted by ETSI for use in Europe.",
    },
    {
      "id": 1,
      "word": "Uncertainty",
      "def":
          "The degree to which a parameter or characteristic cannot be specifically determined.",
    },
    {
      "id": 1,
      "word": "Undershoot",
      "def":
          "Transient change in a converter output voltage that does not meet the lower limit of the voltage accuracy specificiation. Typically occurs at converter turn on/off or with some step change in output load or input line. Also see Voltage Accuracy.",
    },
    {
      "id": 1,
      "word": "Undervoltage lockout",
      "def":
          "Design feature that helps regulate the quality of the output voltage by turning the device OFF in response to supply voltages that fall below its UVLO level. Raychem power switches have a nominal UVLO threshold of 2.5V.",
    },
    {
      "id": 1,
      "word": "Underwriters Laboratory",
      "def":
          "UL - Independent organization that conducts safety testing of products to established standards.",
    },
    {
      "id": 1,
      "word": "U-NII",
      "def":
          "Unlicensed national information infrastructure spectrum, 5.8-GHz.",
    },
    {
      "id": 1,
      "word": "Uninterruptible Power Supply",
      "def":
          "UPS - Power supply that will continue to operate after the loss of AC input power.",
    },
    {
      "id": 1,
      "word": "UNIX",
      "def": "A popular operating system originally developed by Bell Labs.",
    },
    {
      "id": 1,
      "word": "Upconverter (Mixer)",
      "def":
          "A mixer whose desired output signal, called the RF signal, is the sum of the incident baseband (sometimes called the IF) and LO signals.",
    },
    {
      "id": 1,
      "word": "UPS",
      "def":
          "Uninterruptible Power Supply - Power supply that will continue to operate after the loss of AC input power.",
    },
    {
      "id": 1,
      "word": "UTC",
      "def": "Coordinated Universal Time",
    },
    {
      "id": 1,
      "word": "UTM",
      "def":
          "Universal Transverse Mercator. An almost worldwide coordinate projection system using north and east distance measurements from reference point(s). UTM is the primary coordinate system used on U.S. Geological Survey topographic maps.",
    },
    {
      "id": 1,
      "word": "UTP",
      "def":
          "Unshielded twisted pair cable. Cable made from pairs of wires which have been twisted together.",
    },
    {
      "id": 1,
      "word": "UV",
      "def": "Ultraviolet.",
    },
    {
      "id": 1,
      "word": "UVLO",
      "def":
          "Design feature that helps regulate the quality of the output voltage by turning the device OFF in response to supply voltages that fall below its UVLO level. Raychem power switches have a nominal UVLO threshold of 2.5V.",
    },
    {
      "id": 1,
      "word": "Vac",
      "def": "Volts, alternating current.",
    },
    {
      "id": 1,
      "word": "vacuum evaporation",
      "def":
          "A process for generating thin films, in which the film material is vaporized and the vapor deposits itself, through openings in a mask, onto a substrate.",
    },
    {
      "id": 1,
      "word": "Varactor",
      "def":
          "A p-n junction diode that is designed to act as a voltage controlled capacitance when it is operated under reverse bias",
    },
    {
      "id": 1,
      "word": "Varactor-tuned Oscillator",
      "def":
          "An oscillator whose frequency is a function of an externally generated voltage control signal.",
    },
    {
      "id": 1,
      "word": "variable",
      "def": "A quantity that can assume any of a given set of values.",
    },
    {
      "id": 1,
      "word": "Varistor",
      "def":
          "(Variable Resistor) An overvoltage protection device whose resistance decreases during a voltage surge.",
    },
    {
      "id": 1,
      "word": "VCC",
      "def": "Voltage collector",
    },
    {
      "id": 1,
      "word": "VCO",
      "def":
          "Voltage controlled oscillator - An oscillator whose frequency is a function of an externally generated voltage control signal.",
    },
    {
      "id": 1,
      "word": "Vdc",
      "def": "Volts, direct current.",
    },
    {
      "id": 1,
      "word": "VDE",
      "def":
          "Verband Deutscher Elektrontechniker - German organization that sets standards for product safety and noise emissions and test and certifies products to those standards.",
    },
    {
      "id": 1,
      "word": "VDOP",
      "def": "Vertical DOP",
    },
    {
      "id": 1,
      "word": "VDSL",
      "def": "very high bit-rate subscriber line",
    },
    {
      "id": 1,
      "word": "Vector",
      "def":
          "A mathematical representation that has both magnitude and direction.",
    },
    {
      "id": 1,
      "word": "Vector Modulator",
      "def": "A modulator that modulates both amplitude and phase.",
    },
    {
      "id": 1,
      "word": "Velocity of Propagation",
      "def":
          "The ratio of the speed of a radio frequency wave within a cable or dielectric as compared with the same wave in free space.",
    },
    {
      "id": 1,
      "word": "Verband Deutscher Elektrontechniker",
      "def":
          "VDE - German organization that sets standards for product safety and noise emissions and test and certifies products to those standards.",
    },
    {
      "id": 1,
      "word": "very high frequency",
      "def":
          "vhf - A Federal Communications Commission designation for the band from 30 to 300 MHz on the radio spectrum.",
    },
    {
      "id": 1,
      "word": "very-large-scale integration",
      "def":
          "VLSI. An IC that in complexity contains over 1000 gates or their equivalent.",
    },
    {
      "id": 1,
      "word": "vhf",
      "def":
          "Very High Frequency. A Federal Communications Commission designation for the band from 30 to 300 MHz on the radio spectrum.",
    },
    {
      "id": 1,
      "word": "VHSIC",
      "def":
          "Very high speed integrated circuit. A Department of Defense program to develop exceptionally fast ICs.",
    },
    {
      "id": 1,
      "word": "Vias",
      "def": "used to connect traces between two or more layers",
    },
    {
      "id": 1,
      "word": "vibration",
      "def":
          "(1)A continuously reversing change in the magnitude of a force. (2)A mechanical motion or oscillation about a given point of equilibrium.",
    },
    {
      "id": 1,
      "word": "Video",
      "def":
          "The frequency spectrum that corresponds to that of a signal to be displayed in a television or radar system. The video bandwidth is generally considered to extend from DC to several megahertz.",
    },
    {
      "id": 1,
      "word": "Video Impedance",
      "def":
          "The video impedance of a detector diode is the low frequency impedance looking into the diode from the video amplifier. The symbol for video impedance is RV. It is essentially the (AC) slope of the diode at the bias level set up by external bias of the RF signal. This impedance is affected by the DC current flowing in the diode. It is normally specified at a small (i.e., 1 - 100 microamperes) current and can range from 500 ohms to megohms. Some ZBD's are used without bias so RV is specified at zero bias. The video impedance can affect the pulse fidelity of a video detector since the RC time constant depends on RV and the bypass capacitor of the detector circuit.",
    },
    {
      "id": 1,
      "word": "vinyl",
      "def":
          "A form of plastic used as insulation, which has high dielectric strength and low water absorption.",
    },
    {
      "id": 1,
      "word": "viscosity",
      "def":
          "The measure of the resistance of a fluid to flow (either through a specific orifice or in a rotational viscometer). The absolute unit of viscosity measurement is the poise (or centipoise). Kinematic viscosity is expressed in strokes.",
    },
    {
      "id": 1,
      "word": "VLSI",
      "def":
          "Very Large Scale Integration - An IC that in complexity contains over 1000 gates or their equivalent.",
    },
    {
      "id": 1,
      "word": "Vmax",
      "def":
          "The highest voltage that can safely be dropped across a PolySwitch device in its tripped state under specified fault conditions.",
    },
    {
      "id": 1,
      "word": "VMG",
      "def":
          "Velocity Made Good. The rate of closure to a destination based upon your current speed and course.",
    },
    {
      "id": 1,
      "word": "VOD",
      "def": "Video On Demand",
    },
    {
      "id": 1,
      "word": "VoDSL",
      "def": "voice over digital subscriber line",
    },
    {
      "id": 1,
      "word": "voice-frequency",
      "def":
          "vf - Any frequency within that part of the audio-frequency range essential to speech transmission of commercial quality (ie 300 to 3400 Hz). Also referred to as telephone frequency.",
    },
    {
      "id": 1,
      "word": "VoIP",
      "def": "Voice over Internet protocol",
    },
    {
      "id": 1,
      "word": "volatile memory",
      "def":
          "A computer storage medium which is incapable of retaining information without continuous power dissipation.",
    },
    {
      "id": 1,
      "word": "volt",
      "def":
          "Abbreviated V. The unit of measurement of electromotive force. It is equivalent to the force required to produce a current of 1 ampere through a resistance of 1 ohm.",
    },
    {
      "id": 1,
      "word": "Volt Microsecond Constant",
      "def":
          "The product of the voltage applied across the winding and the time for the magnetizing current to reach 1.5 times the linear extrapolation of the current waveform. This constant is a measure of the entergy handling capability of a transformer or inductor. It is dependent upon the core area, core material (including the saturation flux density of the core), the number of turns of the winding and tile duty cycle of the applied pulse.",
    },
    {
      "id": 1,
      "word": "Voltage",
      "def":
          "Symbol E. The term most often used in place of electromotive force, potential, potential difference, or voltage drop to designate the electric pressure that exists between two points and that is capable of producing a current when a closed circuit is connected between the two points. Voltage is measured in volts, millivolts, microvolts, and kilovolts. The terms electromotive force, potential, potential difference, and voltage drop are all often called voltage.",
    },
    {
      "id": 1,
      "word": "Voltage Balance",
      "def":
          "For a multiple output converter, the percentage difference in voltage level of two outputs with opposite polarities and equal nominal values.",
    },
    {
      "id": 1,
      "word": "Voltage Breakdown",
      "def": "The voltage necessary to cause insulation failure.",
    },
    {
      "id": 1,
      "word": "Voltage Controlled Oscillator",
      "def":
          "An oscillator whose frequency is a function of an externally generated voltage control signal.",
    },
    {
      "id": 1,
      "word": "voltage drop",
      "def":
          "The voltage developed across a component or conductor by the flow of current through the resistance or impedance of that component or conductor. Often simply called voltage. Also called 'drop.' The voltage across a resistor is usually called IR drop, while that in a conductor is usually called resistance drop.",
    },
    {
      "id": 1,
      "word": "Voltage Rating",
      "def": "The voltage that may be continuously applied to wire.",
    },
    {
      "id": 1,
      "word": "voltage regulator",
      "def":
          "A circuit capable of generating from a varying input voltage a constant output voltage to a varying load current.",
    },
    {
      "id": 1,
      "word": "Voltage Standing Wave Ratio)",
      "def":
          "VSWR - A measure of the uniformity of impedance along a transmission line, or the quality of the impedance match between a line and the source or load.",
    },
    {
      "id": 1,
      "word": "Voltage Tuned Filter",
      "def":
          "VTF - An electronically tunable, reactive circuit intended to pass or block portions of the electromagnetic spectrum, controlled by an externally generated voltage signal.",
    },
    {
      "id": 1,
      "word": "Volt-Ampere",
      "def":
          "VA - In an a.c. circuit, a measure of apparent power, given by: VA-EI, where E is the potential in volts; I is the curernt in amperes; and VA is apparent power in volt-amperes",
    },
    {
      "id": 1,
      "word": "Volt-Microsecond Constant",
      "def":
          "The product of the voltage applied across the winding and the time for the magnetizing current to reach 1.5 times the linear extrapolation of the current waveform. This constant is a measure of the energy handling capability of a transformer or inductor. It is dependent upon the core area, core material, number of turns, and the duty cycle of the applied pulse.",
    },
    {
      "id": 1,
      "word": "Volume Resistivity",
      "def":
          "The ability of a core to resist the flow of electrical current either through the bulk of the material or on its surface. The unit of the volume resistivity is Ohm-cm. Core volume resistivity becomes an issue in inductor designs where the leads/terminals come in contact with the core material. This type includes axial and radial inductors that have leads epoxied into the core. As for core materials, high permeability ferrites present the most concern as their volume resistivity is typically the lowest. Under certain conditions, a low resistive path can be realized between two inductor terminals if they are in contact with a low resistivity core. The inductor, under these conditions, will lose its higher impedance characteristics. Reciprocal of conductivity.",
    },
    {
      "id": 1,
      "word": "VPN",
      "def": "virtual private network",
    },
    {
      "id": 1,
      "word": "VSAT",
      "def": "Very small aperture terminal.",
    },
    {
      "id": 1,
      "word": "VSWR",
      "def":
          "Voltage Standing Wave Ratio - A measure of the uniformity of impedance along a transmission line, or the quality of the impedance match between a line and the source or load.",
    },
    {
      "id": 1,
      "word": "VTF",
      "def":
          "Voltage Tuned Filter - An electronically tunable, reactive circuit intended to pass or block portions of the electromagnetic spectrum, controlled by an externally generated voltage signal.",
    },
    {
      "id": 1,
      "word": "VTG",
      "def": "An NMEA message",
    },
    {
      "id": 1,
      "word": "vulcanization",
      "def":
          "A chemical reaction in which the physical properties of an elastomer are changed by reacting it with sulfur or other cross-linking agents.",
    },
    {
      "id": 1,
      "word": "VW-1",
      "def":
          "A rating determined by the Underwriters? Laboratories? (UL) optional Vertical Wire Flame Test?the most difficult flame test for tubing. Tubings with a VW-1 rating are highly flame-retardant. Formerly designated FR-1.",
    },
    {
      "id": 1,
      "word": "W crimp",
      "def":
          "Used on SOLISTRAND* terminals. A confined type of crimp that makes two longitudinal indentations which form a 'W' cross section.",
    },
    {
      "id": 1,
      "word": "WAAS",
      "def": "Wide Area Augmentation Signal",
    },
    {
      "id": 1,
      "word": "Wafer",
      "def":
          "A thin, right cylindrical section slice of a semiconductor ingot or boule, from which discrete semiconductors or integrated circuits are manufactured. For RF/microwave devices, a wafer is typically 4 - 6 inches or 100 - 200 mm in diameter, and from 0.005 to 0.030 inches thick. See also substrate.",
    },
    {
      "id": 1,
      "word": "WAG",
      "def": "Wireless Assisted-GPS",
    },
    {
      "id": 1,
      "word": "Wall Thickness",
      "def": "The thickness of the applied insulation or jacket.",
    },
    {
      "id": 1,
      "word": "WAN",
      "def":
          "Wide Area Network- A network which encompasses interconnectivity between devices over a wide geographic area.",
    },
    {
      "id": 1,
      "word": "Warmup Drift",
      "def":
          "Change in the output voltage of a converter over a specified period of time. All other operating parameters (load, line, etc.) are assumed to be held constant. Often specified as starting after a warm up period.",
    },
    {
      "id": 1,
      "word": "warmup time",
      "def":
          "Time measured from the application of power to an operable system (or device) to the instant when it is capable of functioning in its intended manner.",
    },
    {
      "id": 1,
      "word": "warp",
      "def":
          "Dimensional change in a molded, extruded, formed, or fabricated plastic part after processing.",
    },
    {
      "id": 1,
      "word": "Water Absorption Test",
      "def":
          "A method to determine the water uptake of a material. It is time and temperature dependent.",
    },
    {
      "id": 1,
      "word": "Water Blocking",
      "def":
          "The sticking together of insulated wires; usually caused by heat.",
    },
    {
      "id": 1,
      "word": "watt",
      "def":
          "The unit for power, abbreviated as 'W,' equal to 1 joule per second. The practical unit of electric power. In a dc circuit, the power in watts is equal to voltage multiplied by current. In an ac circuit, the true power in watts is effective voltage multiplied by effective current, then multiplied by the circuit power factor. There are 746 watts in 1 horsepower.",
    },
    {
      "id": 1,
      "word": "wattage rating",
      "def":
          "A rating expressing the maximum power that a device can safely handle continuously.",
    },
    {
      "id": 1,
      "word": "Wave",
      "def": "A disturbance that is a function of time, space or both.",
    },
    {
      "id": 1,
      "word": "wave soldering",
      "def":
          "An automatic soldering method whereby the molten solder is pumped from a reservoir through a spout to form a head or wave. The board is then passed over the wave by a conveyor.",
    },
    {
      "id": 1,
      "word": "Waveform",
      "def":
          "The geometric shape of one period of an electric signal when it is plotted or displayed versus time or some other variable.",
    },
    {
      "id": 1,
      "word": "Waveguide",
      "def":
          "A system of material boundaries that direct electromagnetic energy waves. There are many different waveguide configurations, the most popular of which is constructed from hollow rectangular, elliptical or circular cross sections of metal. Some waveguides are filled with materials whose dielectric constants are higher than that of air, such as Teflon'. Waveguides can also be implemented on the surface of a printed circuit board, as is the case for coplanar waveguide.",
    },
    {
      "id": 1,
      "word": "Wavelength",
      "def":
          "The physical distance between two points of identical phase on consecutive cycles of a wave. The symbol for wavelength is lambda, 'l'. Wavelength is related to frequency according to the equation l=c/f, where c is the speed of light (3*108 m/s) f is frequency in Hz.",
    },
    {
      "id": 1,
      "word": "WBI",
      "def": "Web-based Intranets",
    },
    {
      "id": 1,
      "word": "WCDMA",
      "def":
          "Wideband code division multiple access. Wideband CDMA, developed by Ericsson and others, provides higher data rates than present CDMA systems, and has been selected for the third generation of mobile telephone systems in Europe, Japan and the United States.",
    },
    {
      "id": 1,
      "word": "Weber",
      "def":
          "The practical unit of magnetic flux. It is the amount of magnetic flux, which, when linked at a uniform rate with a single turn electric circuit during an interval of one second, will induce an electromotive force of one volt.",
    },
    {
      "id": 1,
      "word": "wedge bond",
      "def":
          "A metal to metal lead bond formed with a wedge-shaped tool. The bond itself may be a cold weld, an ultrasonic or a thermal compression bond.",
    },
    {
      "id": 1,
      "word": "welded circuit",
      "def":
          "A circuit made up of electronic parts which have their leads interconnected by welding techniques.",
    },
    {
      "id": 1,
      "word": "Wetting",
      "def":
          "The formation of a relatively uniform, smooth, unbroken, and adherent film of solder to a base metal. Also, the free flow of solder alloy, with proper application of heat and flux, on a metallic surface to produce an adherent bond.",
    },
    {
      "id": 1,
      "word": "WGS84",
      "def": "World Geodetic Reference 1984",
    },
    {
      "id": 1,
      "word": "White Noise",
      "def":
          "Noise with constant energy per unit bandwidth that is independent of the central frequency.",
    },
    {
      "id": 1,
      "word": "wicking",
      "def":
          "Capillary absorption of liquid (including water) along the fibers of the base material. The flow of solder along the strands and under the insulation of stranded lead wire.",
    },
    {
      "id": 1,
      "word": "Wideband",
      "def":
          "A loosely used term that indicates a large bandwidth to center frequency ratio. A system is considered to be wideband if this ratio is greater than approximately 10 percent.",
    },
    {
      "id": 1,
      "word": "Wilkinson Splitter",
      "def":
          "A transmission line structure that splits power incident on the input port into two or more output ports. In most implementations, the power is divided equally. A Wilkinson splitter can also be used to combine two or more signals.",
    },
    {
      "id": 1,
      "word": "Winchester disk",
      "def":
          "A type of hard disk drive in which the read/write head is held a few millionths of an inch above the disk whenever the disk is spinning.",
    },
    {
      "id": 1,
      "word": "Winding Factor (K)",
      "def":
          "The ratio of the total area of copper wire inside the center hole of a toroid to the window area of the toroid.",
    },
    {
      "id": 1,
      "word": "Window Area (Wa)",
      "def":
          "The area in and around a magnetic core which can be used for the placement of windings.",
    },
    {
      "id": 1,
      "word": "wiping action",
      "def":
          "The action which occurs when contacts are mated with a sliding motion. Wiping has the effect of removing small amounts of contamination from the contact surfaces, thus establishing better conductivity. See also contact wipe.",
    },
    {
      "id": 1,
      "word": "wire",
      "def":
          "A single bare or insulated metallic conductor having solid, stranded, or tinsel construction, designed to carry current in an electric circuit.",
    },
    {
      "id": 1,
      "word": "wire barrel",
      "def":
          "The portion(s) of a terminal, splice, or contact that is crimped. When designed to receive the conductor, it is called the wire barrel. When designed to support or grip the insulation, it is called the insulation barrel. Wire and/or insulation barrels may be either 'open' or 'closed' in design. Closed barrels resemble a hollow cylinder into which the wire must be inserted. Open barrels are formed into an open 'U' and are common to most strip terminals manufactured by AMP Incorporated.",
    },
    {
      "id": 1,
      "word": "Wire Bonding",
      "def":
          "The very low resistance fusion of a conductive wire to a metallized area of a semiconductor die. For most RF/microwave semiconductors, the wire and the topmost layer of metal on the semiconductor die are very pure gold (Au).",
    },
    {
      "id": 1,
      "word": "wire crimp",
      "def":
          "The final configuration of a terminal barrel after the necessary compression forces have been applied to cause a functional union between the terminal barrel and wire.",
    },
    {
      "id": 1,
      "word": "Wire Dress",
      "def": "The orderly arrangement of wires and laced harnesses.",
    },
    {
      "id": 1,
      "word": "wire nut",
      "def":
          "A form of closed end splice, that is screwed on instead of being crimped.",
    },
    {
      "id": 1,
      "word": "wire size",
      "def": "See American Wire Gauge, and circular mil area.",
    },
    {
      "id": 1,
      "word": "wire stop",
      "def":
          "A stop at the end of a terminal wire barrel to prevent wire from passing completely through the barrel in such a way as to interfere with the function of the contact.",
    },
    {
      "id": 1,
      "word": "Wire Wrap",
      "def":
          "Trademark of the Gardner-Denver Corp for a wrap-type termination. See also wrap type.",
    },
    {
      "id": 1,
      "word": "Wiring closet",
      "def":
          "Telecommunications closet. The area of the building that houses the termination of the horizontal cabling.May also contain LAN electronics.",
    },
    {
      "id": 1,
      "word": "Withstanding Voltage",
      "def":
          "The test voltage an electrical connector can withstand for one minute without showing evidence of electrical breakdown when the voltage is applied between conductors and grounding devices of the connectors in various combinations. Also see Breakdown Voltage and Isolation.",
    },
    {
      "id": 1,
      "word": "WLAN",
      "def": "Wireless local area network",
    },
    {
      "id": 1,
      "word": "WLL",
      "def": "Wireless local loop.",
    },
    {
      "id": 1,
      "word": "word",
      "def":
          "A set of bits constituting the smallest addressable unit of information in a programmable memory.",
    },
    {
      "id": 1,
      "word": "word length",
      "def": "The number of bits in a word.",
    },
    {
      "id": 1,
      "word": "word time",
      "def":
          "In reference to words stored serially, the time required to read one word from the main or central memory.",
    },
    {
      "id": 1,
      "word": "Work area",
      "def":
          "Where the users' communications equipment resides.The part of the cabling system between the outlet and the equipment.",
    },
    {
      "id": 1,
      "word": "work harden",
      "def":
          "The hardening of metal from pressure or bending. When the metal gets too hard it becomes brittle.",
    },
    {
      "id": 1,
      "word": "wrap type",
      "def":
          "Method of connecting a solid wire to a square, rectangular, or V-shaped terminal post by tightly wrapping or winding the wire around it with a special automatic or hand-operated tool.",
    },
    {
      "id": 1,
      "word": "write",
      "def": "To deliver data to a medium such as storage.",
    },
    {
      "id": 1,
      "word": "X",
      "def": "Letter symbol used to represent reactance in ohms.",
    },
    {
      "id": 1,
      "word": "X-Axis",
      "def": "The abscissa or horizontal axis in a cartesian plane.",
    },
    {
      "id": 1,
      "word": "xDSL",
      "def":
          "Refers to the various flavors of DSL (Digital Subscriber Loop). All encompassing term.",
    },
    {
      "id": 1,
      "word": "Xistor",
      "def":
          "An active solid-state semiconductor device with three or more electrodes and capable of amplification, rectification, and switching. Important features are low power, small size, and long life. Two main types are bipolar and field effect.",
    },
    {
      "id": 1,
      "word": "XML",
      "def": "extensible markup language",
    },
    {
      "id": 1,
      "word": "Xstr",
      "def":
          "An active solid-state semiconductor device with three or more electrodes and capable of amplification, rectification, and switching. Important features are low power, small size, and long life. Two main types are bipolar and field effect.",
    },
    {
      "id": 1,
      "word": "XTE",
      "def": "Crosstrack Error (XTE/XTK)",
    },
    {
      "id": 1,
      "word": "XTK",
      "def": "Crosstrack Error (XTE/XTK)",
    },
    {
      "id": 1,
      "word": "Y",
      "def":
          "The ratio of current to voltage, the reciprocal of impedance. The unit of admittance is the siemens (S). Admittance is typically abbreviated as 'y' or 'Y.'",
    },
    {
      "id": 1,
      "word": "Y-Axis",
      "def": "The ordinate or vertical axis in a cartesian plane",
    },
    {
      "id": 1,
      "word": "yield",
      "def":
          "The ratio of usable components, at the end of a manufacturing process, to the number of components initially submitted for processing.",
    },
    {
      "id": 1,
      "word": "y-Parameter",
      "def":
          "The set of parameters for a two port device that relates the input and output currents to the input and output voltages.",
    },
    {
      "id": 1,
      "word": "Z",
      "def": "Letter symbol used to represent impedance in ohms.",
    },
    {
      "id": 1,
      "word": "Z0",
      "def": "The characteristic impedance of a device or system.",
    },
    {
      "id": 1,
      "word": "Zener Diode",
      "def":
          "A diode that maintains a relatively constant voltage when the reverse voltage across it is increased passed a specific point, called the zener voltage.",
    },
    {
      "id": 1,
      "word": "zero voltage switch",
      "def":
          "A circuit designed to switch 'on' at the moment the ac supply voltage crosses zero. This technique minimizes the radio frequency interference generated at switch closure.",
    },
    {
      "id": 1,
      "word": "zero-suppression",
      "def": "The elimination of nonsignificant zeros in a numeral.",
    },
    {
      "id": 1,
      "word": "ZIF",
      "def":
          "Zero Insertion Force - A component designed to eliminate the insertion and withdrawal forces during engaging and separating.",
    },
    {
      "id": 1,
      "word": "Zone cabling",
      "def":
          "An architectural concept which splits the horizontal cabling into two sections. Eliminates the need to replace the entire horizontal cable in moves, adds and changes.",
    },
    {
      "id": 1,
      "word": "z-Parameter",
      "def":
          "The set of parameters for a two port device that relates the input and output voltages to the input and output currents.",
    },
  ];
}
