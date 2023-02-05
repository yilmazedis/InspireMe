showDataAlert(BuildContext context) {

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: appShapeBorder(),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const Text(
            "Choose An Avatar",
            style: TextStyle(fontSize: 24.0),
          ),
          content: SizedBox(
            // Specify some width
            height: 300.0, // Change as per your requirement
            width: 300.0,
            child: Scrollbar(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children:
                  List.generate(50, (index) {
                    return GridTile(
                        child: IconButton(
                          icon: Icon(
                            IconData(0xe0b1 + index, fontFamily: 'MaterialIcons'),
                            size: 30.0,
                            color: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            print("asdasd");
                          },
                        ));
                  })),
            ),
          )
        );
      });
}
