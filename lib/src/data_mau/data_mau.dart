

dynamic api_MachineAnalysisError_example = [
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 145,
    "FREN": 1,
    "ERROR_CODE": "180411",
    "ERROR": "Feeder Pull-out error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 99,
    "FREN": 2,
    "ERROR_CODE": "180364",
    "ERROR": "Feeder Setting Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 172,
    "FREN": 2,
    "ERROR_CODE": "180314",
    "ERROR": "PCB Transfer Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 717,
    "FREN": 7,
    "ERROR_CODE": "180414",
    "ERROR": "Tape Jamming Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 85,
    "FREN": 3,
    "ERROR_CODE": "180394",
    "ERROR": "Feeder Error Rate Stop "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 873,
    "FREN": 20,
    "ERROR_CODE": "Other",
    "ERROR": "Other"
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 83,
    "FREN": 5,
    "ERROR_CODE": "180327",
    "ERROR": "Part Fall "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 2570,
    "FREN": 78,
    "ERROR_CODE": "180306",
    "ERROR": "Part Pickup Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 9,
    "FREN": 1,
    "ERROR_CODE": "180309",
    "ERROR": "Part Mount Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 2551,
    "FREN": 96,
    "ERROR_CODE": "180307",
    "ERROR": "Parts Recognition Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 10,
    "FREN": 1,
    "ERROR_CODE": "180332",
    "ERROR": "Pickup Pos Recog Error "
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H3",
    "STATUS": "ERROR",
    "TotalTime": 2309,
    "FREN": 37,
    "ERROR_CODE": "180343",
    "ERROR": "Top Tape Exhaust "
  }
];

dynamic apiMachineTotalTrend = [
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-20",
    "OK": 42275,
    "NG": 1843
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-21",
    "OK": 87235,
    "NG": 1430
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-22",
    "OK": 83106,
    "NG": 163
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-23",
    "OK": 90935,
    "NG": 95
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-24",
    "OK": 74702,
    "NG": 1005
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-25",
    "OK": 79282,
    "NG": 4419
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H4",
    "DATE_TIME": "2025-08-26",
    "OK": 28103,
    "NG": 940
  }
];

dynamic getErrorDetail_example = [
  {
    "ID": 119,
    "Sub_code": "180343",
    "Name_error": "Top Tape Exhaust(Lỗi kẹt tape)",
    "Cause": "Cover tape is broken(Tape nhựa bị đứt)",
    "solution": "Reset the cover tape properly(Lắp đặt lại dây tape đúng cách)"
  }
];

dynamic getListConfirm_example = [
  {
    "ID": null,
    "line": "BN3G2",
    "time_alarm": "12:28:09",
    "date_alarm": "2025-08-28",
    "content": "BN3G2-H7-ERROR-2025-08-28 12:28:09-2025-08-28 12:34:04---Parts Recognition Error -ID12379457",
    "EMP_confirm": null,
    "root_": null,
    "act": null,
    "type": "MACHINE",
    "date_time": "2025-08-28 12:28:09",
    "IDD": 1105694583,
    "signal": null,
    "signal_tuan": null,
    "mark": null
  },
  {
    "ID": null,
    "line": "BN3G1",
    "time_alarm": "12:28:09",
    "date_alarm": "2025-08-28",
    "content": "BN3G1-H7-ERROR-2025-08-28 12:28:09-2025-08-28 12:34:04---Parts Recognition Error -ID12379456",
    "EMP_confirm": null,
    "root_": null,
    "act": null,
    "type": "MACHINE",
    "date_time": "2025-08-28 12:28:09",
    "IDD": 1105694582,
    "signal": null,
    "signal_tuan": null,
    "mark": null
  }
];

dynamic apiMachineMachineStatus = [
  {
    "LINE": "Line_1F",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": "RUN-None",
  },
  {
    "LINE": "Line_1R",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": null,
  },
  {
    "LINE": "Line_2F",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": "RUN-None",
  },
  {
    "LINE": "Line_2R",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": null,
  },
  {
    "LINE": "Line_4F",
    "PRINTER": "OFFt-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": "RUN-None",
  },
  {
    "LINE": "Line_4R",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "RUN-None",
    "H5": "RUN-None",
    "H6": "RUN-None",
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": null,
  },
  {
    "LINE": "Line_5F",
    "PRINTER": "NA-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "ERROR-180343",
    "H5": "RUN-None",
    "H6": null,
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": "RUN-None",
  },
  {
    "LINE": "Line_5R",
    "PRINTER": "RUN-None",
    "H1": "RUN-None",
    "H2": "RUN-None",
    "H3": "RUN-None",
    "H4": "ERROR-180343",
    "H5": "RUN-None",
    "H6": null,
    "H7": "RUN-None",
    "H8": "RUN-None",
    "REFLOW": null,
  },
];

dynamic getDataErrorCauseSolution_example = [
  {
    "error_code": "MACHINE",
    "causes": "\nDừng chuyền kiểm kê vật liệu.",
    "solution": "Kiểm kê trước."
  },
  {
    "error_code": "MACHINE",
    "causes": "Both nozzle position and \ndiameter were judged to be \nabnormal during nozzle \nposition recognition./ Cả vị trí và đường kính miệng hút đều được đánh giá là bất thường trong quá trình nhận dạng vị trí miệng hút.\n",
    "solution": "Check nozzle corect species with program. / Kiểm tra miệng hút có đúng với chương trình.,Check the nozzles are free of\nbend or other defects. / Kiểm tra xem các miệng hút có bị dính không cong hoặc các khuyết tật khác."
  },
  {
    "error_code": "MACHINE",
    "causes": "CHANGE MODEL",
    "solution": "CHANGE MODEL"
  },
  {
    "error_code": "MACHINE",
    "causes": "Clogged nozzle detected. / Phát hiện lỗi đầu hút bị tắc\n.",
    "solution": "Clean the applicable nozzle. / \nLàm sạch đầu hút."
  },
  {
    "error_code": "MACHINE",
    "causes": "Component dropped \nduring after recognition \nbefore it was mounted. / Linh kiện bị rơi\n sau khi được nhận dạng và \ntrước khi nó được gắn xuống PCB.",
    "solution": "Remove dropped component and\n restart the machine. / Loại bỏ linh kiện bị rơi và \nkhởi động lại máy."
  },
  {
    "error_code": "MACHINE",
    "causes": "Component is not\n securely picked up by the\nnozzle. / Miệng hút hút lỗi liệu.",
    "solution": "Remove the component and\n restart production. / Loại bỏ linh kiện và\n bắt đầu lại."
  },
  {
    "error_code": "MACHINE",
    "causes": "Emergency stop switch of\nthe adjoining machine has \nbeen pressed. / Công tắc dừng khẩn cấp của máy liền kề đã được nhấn.",
    "solution": "Release the emergency stop\n status of the adjoining machine. / Nhả nút dừng khẩn cấp \ntình trạng của máy liền kề."
  },
  {
    "error_code": "MACHINE",
    "causes": "Failed to make feeder setting. / Cài đặt feeder lỗi.",
    "solution": "Replace feeder. / Thay feeder.,Replace cart. / Thay xe feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Feeder cover not attached. / Nắp feeder không được gắn vào.",
    "solution": "Attach the feeder cover. / Gắn nắp feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Feeder was pulled out due to\na reason other than \ncomponent empty. / \n\nFeeder bị kéo ra do tác động khác.",
    "solution": "Set the feeder again.\n / Cài đặt lại feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Foreign body found at the\n transfer opening. / Vật thể lạ được tìm thấy tại cảm biến opening.",
    "solution": "Remove any foreign body from\n the transfer opening. / Loại bỏ bất kỳ vật lạ nào ra khỏi\n cảm biến opening."
  },
  {
    "error_code": "MACHINE",
    "causes": "Improper component feed. / Feeder lỗi.",
    "solution": "Replace the feeder. / Thay feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Improper components are\nset. / Các cài đặt linh kiện chưa phù hợp.",
    "solution": "Set the correct components. / Đặt các thông số nhận dạng chính xác."
  },
  {
    "error_code": "MACHINE",
    "causes": "Incorrect component data\n(component dimensions^\netc.). / Dữ liệu thành phần không chính xác\n (kích thước thành phần^\nvân vân.).",
    "solution": "Check the component data\n(component dimensions, etc.). / Kiểm tra dữ liệu linh kiện\n(kích thước thành phần, v.v.)."
  },
  {
    "error_code": "MACHINE",
    "causes": "Incorrect pickup position. / Lệch tâm.",
    "solution": "Teach feeder. / Teachh tâm feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Invalid component data\nheight. / Dữ liệu linh kiện không đúng.",
    "solution": "Correct the component data. / Chỉnh sửa dữ liệu của linh kiện."
  },
  {
    "error_code": "MACHINE",
    "causes": "MAINTAIN",
    "solution": "MAINTAIN"
  },
  {
    "error_code": "MACHINE",
    "causes": "Motor feeder không cuốn bóng.",
    "solution": "Thay feeder."
  },
  {
    "error_code": "MACHINE",
    "causes": "Nozzle height offset is\nbeyond the threshold value. \nPre-scanning setting of the \nvertical line camera could not\nbe made. / \nĐộ lệch chiều cao miệng hút là\nvượt quá giá trị ngưỡng.\n Cài đặt quét trước của\ncamera đường dọc không thể\n được thực hiện.",
    "solution": "The offset value of the nozzle height \ndetection is not correct. Calibrate\nthe origin offset Z-axis and vertical\nline camera. / \nGiá trị bù của chiều cao miệng hút \nphát hiện là không chính xác. Hiệu chỉnh \ntrục Z lệch gốc và trục dọc \nứng dụng camera line."
  },
  {
    "error_code": "MACHINE",
    "causes": "Nozzle or filter clogged. / Miệng hút hoặc bộ lọc bị tắc.",
    "solution": "Clean the nozzle and filter. / Làm sạch miệng hút và bộ lọc."
  },
  {
    "error_code": "MACHINE",
    "causes": "NPI",
    "solution": "NPI"
  },
  {
    "error_code": "MACHINE",
    "causes": "Obstacle detected at the left/right \nNPM conveyor outer opening \nsensor or right opening\n sensor of the adjoining\n machine. / Chướng ngại vật được phát hiện ở cảm biến mở ngoài băng tải NPM bên trái hoặc cảm biến mở bên phải\n của máy liền kề.",
    "solution": "Remove the obstacle from the left/right \nNPM conveyor outer opening \nsensor or right opening sensor of\nthe adjoining machine. / Loại bỏ chướng ngại vật khỏi cảm biến mở ngoài băng tải NPM bên trái hoặc cảm biến mở bên phải của máy liền kề."
  },
  {
    "error_code": "MACHINE",
    "causes": "PCB failed to be transferred \nproperly.\n / PCB di chuyển bị lỗi.",
    "solution": "Check inside the machine and \nremove the PCB.\n/ Kiểm tra băng tải bên trong máy và di chuyển PCB đến sensor"
  },
  {
    "error_code": "MACHINE",
    "causes": "PCB is removed or is not\n placed at the correct position. / \n\nPCB có được nhấc ra ngoài hoặc đặt lại đúng vị trí.",
    "solution": "Set the PCB in position. / Đặt PCB vào vị trí.,If the PCB is removed, press the\n[PCB Remove] button. / Nếu PCB bị nhấc ra, hãy nhấn nút\n [ PCB Remove]."
  },
  {
    "error_code": "MACHINE",
    "causes": "PCB recognition coordinates are incorrect. / Tọa độ nhận dạng của PCB  không chính xác.",
    "solution": "Contact ME program adjust program mark different. / Liên hệ ME chương trình sửa chương trình bắt điểm mắt khác."
  },
  {
    "error_code": "MACHINE",
    "causes": "Pickup errors or recognition errors have\noccurred beyond the bad feeder error rate set in action parameters.\n\n / Tỷ lệ lỗi hút hoặc nhận dạng cao ngoài tỷ lệ cài đặt trong tham số.",
    "solution": "Check the condition of the feeder\nand clean it if necessary. / \nKiểm tra tình trạng feeder và vệ sinh làm sạch nếu cần thiết. "
  },
  {
    "error_code": "MACHINE",
    "causes": "Recognition error occurred due to dirt on PCB. / Lỗi nhận dạng xảy ra do bụi bẩn trên PCB.",
    "solution": "After cleaning the recognition\n camera and PCB, press the Rerecognize\n button. / Sau khi làm sạch điểm nhận dạng,\n camera và PCB, nhấn nút Nhận dạng lại."
  },
  {
    "error_code": "MACHINE",
    "causes": "Recognition error\ncomponent failed. / Lỗi nhận dạng \nlinh kiện.",
    "solution": "Remove the remaining\ncomponents from the nozzles and \nrestart the machine. / Loại bỏ linh kiện còn dính từ miệng hút và \nchạy lại máy."
  },
  {
    "error_code": "MACHINE",
    "causes": "Recognition result of cart \noffset mark is beyond the \nspecified range. / Kết quả nhận dạng xe feeder \ngiá trị bù vượt quá\n phạm vi quy định.",
    "solution": "Replace feeder cart. / Thay xe xe feeeder.,Contact ME maintenance. / Liên hệ bảo dưỡng."
  },
  {
    "error_code": "MACHINE",
    "causes": "Safety cover is open.\n\n / Cửa an toàn của máy bị mở.\n",
    "solution": "Close the safety cover if opened. / Đóng nắp an toàn nếu mở.,If the error persists even after the\nsafety cover is closed, the safety\n switch may be at fault contact \nmaintenance. / Nếu lỗi vẫn tiếp diễn ngay cả sau khi\n nắp an toàn được đóng lại, an toàn\n công tắc có thể bị lỗi liên hệ bảo dưỡng."
  },
  {
    "error_code": "MACHINE",
    "causes": "Sensor may be at fault. / \nCảm biến có thể bị lỗi.",
    "solution": "Lấy liệu dính ở miệng hút ra\n,Check vacuum không đạt báo bảo dưỡng."
  },
  {
    "error_code": "MACHINE",
    "causes": "Sensor may be at fault. / Cảm biến có thể bị lỗi.",
    "solution": "Check vaccum and if\nany problem is found, contact\n maintenance. / Kiểm tra khí hút máy và nếu\n bất thường báo liên hệ dưỡng."
  },
  {
    "error_code": "MACHINE",
    "causes": "The cover tape jammed in\n the mechanism or some\n other trouble occurred. / \n\nTape bị kẹt trong cơ cấu quay của feeder hoặc 1 vài vấn đề khác của feeder xảy ra lỗi.",
    "solution": "Make sure the reel is properly\ninstalled. / Đảm bảo cuộn quay cài đặt đúng cách.,Replace feeder. / Thay feeder."
  }
];
