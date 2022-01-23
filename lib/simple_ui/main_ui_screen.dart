import 'package:covid19_with_bloc/simple_ui/ui_model.dart';
import 'package:flutter/material.dart';

class MainUiScreen extends StatelessWidget {
  const MainUiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(Icons.menu, color: Colors.black45),
      ),
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 20.0,
                    ),
              ),
              trailing: Container(
                height: 34.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF720071),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: const Icon(Icons.download, color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * 0.5,
              width: double.infinity,
              child: GridView.builder(
                  itemCount: getModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.05,
                  ),
                  itemBuilder: (context, index) {
                    final Model model = getModel[index];
                    return Card(
                      elevation: 6.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15.0),
                          index == 3
                              ? Column(
                                  children: [
                                    const Text(
                                      'hrs : mins',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      model.numbers,
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        color: model.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              : Text(
                                  model.numbers,
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    color: model.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          const SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                model.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            buildContainer(context, 'All Batches'),
            const SizedBox(height: 15.0),
            buildContainer(context, 'Certified Student'),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigation(context),
    );
  }

  Widget getBottomNavigation(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.grey[200]),
      child: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Question'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: 'Start T/Q'),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context, String title) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF03008F),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 18.0,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
        ),
        trailing: Container(
          height: 35.0,
          width: 35.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepOrange,
          ),
          child: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
