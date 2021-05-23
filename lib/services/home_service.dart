import 'dart:async';

import '../config/config_service.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';
import 'dart:convert';

abstract class DataHomeService extends ConfigService {}

class HomeService extends DataHomeService {
  Future<Map<String, dynamic>> getProjects() async {
    return {
      "Meditate": {
        "img": "assets/1m.png",
        "technologies": ['assets/flutter.png'],
        "description":
            'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
        "links": {
          "App store": {"img": 'assets/apple.png', "url": 'https://google.com'},
          "Google play": {
            "img": 'assets/google.png',
            "url": 'https://google.com',
          }
        }
      },
      "Energe": {
        "img": "assets/1w.png",
        "technologies": ['assets/react.png', 'assets/node.png'],
        "description":
            'Website for dutch renovating company created. It takes clients data, counts new usage values and sends them to the company through ZOHO CRM.',
        "links": {
          "Live": {
            "img": 'assets/live.png',
            "url": 'https://distracted-booth-ae59fb.netlify.app/'
          },
        }
      },
      "Opqn": {
        "img": "assets/2m.png",
        "technologies": [
          'assets/java.png',
          'assets/node.png',
          'assets/sql.png'
        ],
        "description":
            'Study project that allows user to share health data with dietitians.',
        "links": {
          "Mobile repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/opqn-mobile'
          },
          "API repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/opqn-api',
          }
        }
      },
      "Obb-Sys": {
        "img": "assets/2w.png",
        "technologies": [
          'assets/react.png',
          'assets/node.png',
          'assets/sql.png'
        ],
        "description":
            'My engineering project for Centre of Biomedical Research. It allows user to collect data and statistics that later shows if there are any symptoms of being sick, of animal.',
        "links": {
          "Web repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/obb-web'
          },
          "API repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/obb-api',
          }
        }
      },
      "Animacare": {
        "img": "assets/3m.png",
        "technologies": [
          'assets/flutter.png',
          'assets/node.png',
          'assets/sql.png'
        ],
        "description":
            'My own project I\'m currently working on (on hold). Application for people that love their animals and want to compare them with other users, track their data and more.',
        "links": {
          "Git repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/animal_care'
          },
        }
      },
      "Opqn-web": {
        "img": "assets/3w.png",
        "technologies": [
          'assets/react.png',
          'assets/node.png',
          'assets/sql.png'
        ],
        "description":
            'Easy project that allows user to share health data with dietitians.',
        "links": {
          "Web repo": {
            "img": 'assets/git.png',
            "url": 'https://github.com/wojciechkubiak/opqn-web'
          },
        }
      },
    };
  }

  Future<Map<String, dynamic>> getTechnologies() async {
    return {
      "Flutter": {
        "icon": "assets/flutter.png",
        "background": "assets/flutter.webp",
        "description": [
          "Objective programming",
          "Making of views and app logic",
          "BLoC architecture",
          "Implementation and modification of existing packages",
          "Animations"
        ]
      },
      "ReactJS": {
        "icon": "assets/react.png",
        "background": "assets/react.webp",
        "description": [
          "React Hooks",
          "Functional programming",
          "Objective programming",
          "External libraries implementation",
          "Basics of Redux"
        ]
      },
      "NodeJS": {
        "icon": "assets/node.png",
        "background": "assets/node.webp",
        "description": ["Basics of ExpressJS", "REST API", "MVC", "Sequelize"]
      },
      "JavaScript": {
        "icon": "assets/javascript.png",
        "background": "assets/javascript.webp",
        "description": [
          "ES6+",
          "DOM Manipulation",
          "Functional programming",
          "Objective programming",
          "Async",
          "Basics of TypeScript"
        ]
      },
      "Python": {
        "icon": "assets/python.png",
        "background": "assets/python.webp",
        "description": [
          "Basic syntax",
          "Basic functionalities",
          "Simple web apps implementation"
        ]
      },
      "SQL": {
        "icon": "assets/sql.png",
        "background": "assets/sql.webp",
        "description": ["MySQL / PostgreSQL syntax", "Joins", "T-SQL"]
      },
      "HTML": {
        "icon": "assets/html.png",
        "background": "assets/html.webp",
        "description": [
          "Semi-advanced syntax",
        ]
      },
      "CSS": {
        "icon": "assets/css.png",
        "background": "assets/css.webp",
        "description": [
          "CSS Grid",
          "Flexbox",
          "SASS",
          "Animations",
          "Responsive web design"
        ]
      },
    };
  }
}
