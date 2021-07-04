import 'dart:async';

class HomeService {
  Map<String, List<Map<String, dynamic>>> getProjects() {
    return {
      "web": [
        {
          "title": "Obb-sys",
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
        {
          "title": "Energe",
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
        {
          "title": "Opqn-web",
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
      ],
      "mobile": [
        {
          "title": "Meditate",
          "img": "assets/1m.png",
          "technologies": ['assets/flutter.png'],
          "description":
              'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
          "links": {
            "App store": {
              "img": 'assets/apple.png',
              "url": 'https://google.com'
            },
            "Google play": {
              "img": 'assets/google.png',
              "url": 'https://google.com',
            }
          }
        },
        {
          "title": "Opqn",
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
        {
          "title": "Achill",
          "img": "assets/3m.png",
          "technologies": [
            'assets/flutter.png',
            'assets/node.png',
            'assets/sql.png'
          ],
          "description":
              'My own project I\'m currently working on (on hold). Application for wild animals that just cannot chill.',
          "links": {
            "Git repo": {
              "img": 'assets/git.png',
              "url": 'https://github.com/wojciechkubiak/animal_care'
            },
          }
        }
      ]
    };
  }

  List<Map<String, dynamic>> getTechnologies() {
    return [
      {
        "title": "Flutter",
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
      {
        "title": "ReactJS",
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
      {
        "title": "NodeJS",
        "icon": "assets/node.png",
        "background": "assets/node.webp",
        "description": ["Basics of ExpressJS", "REST API", "MVC", "Sequelize"]
      },
      {
        "title": "JavaScript",
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
      {
        "title": "Python",
        "icon": "assets/python.png",
        "background": "assets/python.webp",
        "description": [
          "Basic syntax",
          "Basic functionalities",
          "Simple web apps implementation"
        ]
      },
      {
        "title": "SQL",
        "icon": "assets/sql.png",
        "background": "assets/sql.webp",
        "description": ["MySQL / PostgreSQL syntax", "Joins", "T-SQL"]
      },
      {
        "title": "HTML",
        "icon": "assets/html.png",
        "background": "assets/html.webp",
        "description": [
          "Semi-advanced syntax",
        ]
      },
      {
        "title": "CSS",
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
    ];
  }

  List<Map<String, dynamic>> getOrderData() {
    return [
      {
        "title": "Web",
        "icon": "assets/web.png",
        "description":
            "If you need a website, you've come to the right place. I am able to make a full-fledged web application based on your preferences."
      },
      {
        "title": "Mobile",
        "icon": "assets/mobile.png",
        "description":
            "There is mobile application on your mind? Don't hesitate and send me a message. Creating an eye-catching mobile application is not a problem for me, which is confirmed by my current professional experience."
      },
      {
        "title": "Backend/Databases",
        "icon": "assets/cloud.png",
        "description":
            "Connecting your application to the database is a struggle? I can help you with both database model and communication with already created one. Handling data storage is pleasure with me."
      }
    ];
  }
}
