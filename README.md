# medimind

HCI Project Work 2023 by Group 9-03

Cedric Phua (2A3)
Asher Ang (2A3)
Fu Zixuan (2A3) 

PROBLEM STATEMENT

“Elderly struggle with medication management.”

Commit to Master 

OUR OBJECTIVES

Make a medication reminder mobile app which will...

Make elderly's lives easier 

Simplify medication management through easy and simple UI using visual aids 

Reduce anxiety and stress about when and how to take medicine


  bool dawnCheckbox = false;
  bool morningCheckbox = false;
  bool afternoonCheckbox = false;
  bool eveningCheckbox = false;
  bool nightCheckbox = false;
  int pills = 1;
  String medDuration = "1";
  
  
  
                    Padding(
                    padding: EdgeInsets.all(8.0),
                  ),

                  // ********************* Start of Medicine Name *********************
                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                size: 50,
                                color: Colors.blue,
                                Icons.badge_outlined),
                            title: Text(
                              'medname'.tr(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text('nameDesc'.tr()),
                          ),
                          SizedBox(
                            width: 325,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'enterName'.tr(),
                                filled: false, //<-- SEE HERE
                                fillColor: Colors.grey,
                              ),

                              keyboardType: TextInputType.multiline,
                              minLines: 1, // <-- SEE HERE
                              maxLines: 1, // <-- SEE HERE
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),

                  // ********************* Start of Time *********************

                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                size: 50,
                                color: Colors.blue,
                                Icons.schedule_outlined),
                            title: Text(
                              'time'.tr(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text('timeDesc'.tr()),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: new Image.asset(
                                        'assets/images/dawn.png')),
                                IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: new Image.asset(
                                        'assets/images/morning.png')),
                                IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: new Image.asset(
                                        'assets/images/afternoon.png')),
                                IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: new Image.asset(
                                        'assets/images/evening.png')),
                                IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: new Image.asset(
                                        'assets/images/night.png')),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Checkbox(
                                value: dawnCheckbox,
                                onChanged: (value) {
                                  setState(() {
                                    dawnCheckbox = !dawnCheckbox;
                                  });
                                },
                              ),
                              Checkbox(
                                value: morningCheckbox,
                                onChanged: (value) {
                                  setState(() {
                                    morningCheckbox = !morningCheckbox;
                                  });
                                },
                              ),
                              Checkbox(
                                value: afternoonCheckbox,
                                onChanged: (value) {
                                  setState(() {
                                    afternoonCheckbox = !afternoonCheckbox;
                                  });
                                },
                              ),
                              Checkbox(
                                value: eveningCheckbox,
                                onChanged: (value) {
                                  setState(() {
                                    eveningCheckbox = !eveningCheckbox;
                                  });
                                },
                              ),
                              Checkbox(
                                value: nightCheckbox,
                                onChanged: (value) {
                                  setState(() {
                                    nightCheckbox = !nightCheckbox;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  // ********************* Start of Dosage *********************
                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                size: 55,
                                color: Colors.blue,
                                Icons.medication_rounded),
                            title: Text(
                              'dosage'.tr(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text('dosageDesc'.tr()),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  iconSize: 50,
                                  color: Colors.blue,
                                  onPressed: () {
                                    setState(() {
                                      pills++; //calling setState to decrease count by 1
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                  ),
                                ),
                                Text(
                                  pills.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 50,
                                  color: Colors.blue,
                                  onPressed: () {
                                    setState(() {
                                      pills--; //calling setState to decrease count by 1
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  // ********************* Start of Duration *********************
                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                size: 55,
                                color: Colors.blue,
                                Icons.calendar_month),
                            title: Text(
                              'duration'.tr(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text('durationDesc'.tr()),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DropdownButton(
                                    value: medDuration,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      letterSpacing: 0.27,
                                      color: Colors.black,
                                    ),
                                    items: dropdownItems,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        medDuration = newValue!;
                                      });
                                    }),
                                Text(
                                  "durationDay".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: 0.27,
                                    color: Colors.black,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),

                  // ********************* Start of Visual Aids *********************
                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                size: 50,
                                color: Colors.blue,
                                Icons.elderly_sharp),
                            title: Text(
                              'visualaids'.tr(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.27,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text('visualaidsDesc'.tr()),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  iconSize: 70,
                                  color: Colors.grey,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.photo,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 90,
                                  color: Colors.blue,
                                  onPressed: () {
                                    isVideo = true;
                                    _onImageButtonPressed(ImageSource.camera,
                                        context: context);
                                  },
                                  icon: Icon(
                                    Icons.video_call,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 60,
                                  color: Colors.grey,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                  ),
                                ),
                              ]),
                          SizedBox(
                              height: 250, width: 400, child: _handlePreview()),
                        ],
                      ),
                    ),
                  ),

                  // ********************* Start of Notification Demo *********************

                  Card(
                    elevation: 2, // the size of the shadow
                    shadowColor: Colors.black, // shadow color

                    child: SizedBox(
                      width: 365,
                      child: Column(
                        children: [
                          ListTile(
                              leading: Icon(
                                  size: 40,
                                  color: Colors.blue,
                                  Icons.notifications_active),
                              title: Text(
                                'notification'.tr(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 0.27,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text('testnotificationDesc'.tr()),
                              trailing: IconButton(
                                iconSize: 40,
                                color: Colors.orange,
                                onPressed: () {
                                  NotificationController
                                      .createNewNotification();
                                },
                                icon: Icon(
                                  Icons.ads_click_sharp,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),


  
