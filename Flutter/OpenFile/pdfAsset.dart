Future<File> pdfAsset() async {
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/set_any_name.pdf');
    ByteData bd = await rootBundle.load('assets/en/legal_notes.pdf');
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    return tempFile;
  }
pdfAsset().then((file){OpenFile.open(file.path);});
