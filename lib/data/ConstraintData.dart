var mainLightDarkMode = true ;

final location = "https://a830-2405-4802-6ee7-22c0-b51e-f34c-fa01-2c6a.ngrok-free.app" ;
// final location = "http://localhost:5000" ;

// Hàm chuyển số CCCD thành ngày tháng năm
String formatIDToDate(String idNumber) {
  if (idNumber.length != 8) return "Invalid"; // Kiểm tra hợp lệ

  String day = idNumber.substring(0, 2);  // "13"
  String month = idNumber.substring(2, 4); // "02"
  String year = idNumber.substring(4, 8);  // "2004"

  return "$year-$month-$day"; // Trả về định dạng YYYY-MM-DD
}

