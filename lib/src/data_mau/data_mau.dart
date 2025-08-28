
dynamic api_dashboard_error_example = {
  "data": [
    {"count": 4, "error_code": "G0012", "percentage": 36.36},
    {"count": 4, "error_code": "G0014", "percentage": 36.36},
    {"count": 3, "error_code": "G0015", "percentage": 27.27},
  ],
};

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
    "LINE": "Line_5F",
    "MACHINE_CODE": "H7",
    "STATUS": "ERROR",
    "ERROR": "Part Pickup Error ",
    "ERROR_CODE": "180306",
    "root_": "-Clogged nozzle detected. / Phát hiện lỗi đầu hút bị tắc\n.",
    "EMP_confirm": "BuiVanChien",
    "act": "Clean the applicable nozzle. / \nLàm sạch đầu hút.",
    "START_TIME": "2025-08-26 07:08:39",
    "END_TIME": "2025-08-26 07:19:16",
    "TIMER": 637
  },
  {
    "LINE": "Line_5F",
    "MACHINE_CODE": "H7",
    "STATUS": "ERROR",
    "ERROR": "Part Pickup Error ",
    "ERROR_CODE": "180306",
    "root_": "-Clogged nozzle detected. / Phát hiện lỗi đầu hút bị tắc\n.",
    "EMP_confirm": "BuiVanChien",
    "act": "Clean the applicable nozzle. / \nLàm sạch đầu hút.",
    "START_TIME": "2025-08-26 07:08:39",
    "END_TIME": "2025-08-26 07:19:16",
    "TIMER": 637
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H7",
    "STATUS": "ERROR",
    "ERROR": "Part Pickup Error ",
    "ERROR_CODE": "180306",
    "root_": "-Clogged nozzle detected. / Phát hiện lỗi đầu hút bị tắc\n.",
    "EMP_confirm": "BuiVanChien",
    "act": "Clean the applicable nozzle. / \nLàm sạch đầu hút.",
    "START_TIME": "2025-08-26 07:08:39",
    "END_TIME": "2025-08-26 07:19:16",
    "TIMER": 637
  },
  {
    "LINE": "Line_5R",
    "MACHINE_CODE": "H7",
    "STATUS": "ERROR",
    "ERROR": "Part Pickup Error ",
    "ERROR_CODE": "180306",
    "root_": "-Clogged nozzle detected. / Phát hiện lỗi đầu hút bị tắc\n.",
    "EMP_confirm": "BuiVanChien",
    "act": "Clean the applicable nozzle. / \nLàm sạch đầu hút.",
    "START_TIME": "2025-08-26 07:08:39",
    "END_TIME": "2025-08-26 07:19:16",
    "TIMER": 637
  }
];
dynamic getErrorByCode_example = {
  "error_list": [
    {
      "cause": "Xylanh không đi hết hành trình",
      "error_code": "G0012",
      "error_name": "Bất thường xylanh/Cylinder error",
      "id": 27,
      "solution": "Kiểm tra van, khí, đế van...",
    },
    {
      "cause": "Cảm biến xylanh không hoạt động",
      "error_code": "G0012",
      "error_name": "Bất thường xylanh/Cylinder error",
      "id": 28,
      "solution": "Kiểm tra cảm biến hoặc từ trong xylanh...",
    },
  ],
  "idconfirm": 14,
};
dynamic getViewMaintenance_monthly_example = {
  "history": [
    {
      "action_taken": "Thay dầu và lọc dầu",
      "content": "Kiểm tra dầu thủy lực",
      "created_at": "2025-07-26 11:47:53.140000",
      "maintainer": "Nguyễn Đức Hải",
      "maintenance_type": "MONTHLY",
      "no": 1,
      "tech_spec": "Dầu thủy lực không đục, nhiệt độ ổn định",
    },
    {
      "action_taken": "Thay dầu và lọc dầu",
      "content": "Kiểm tra dầu thủy lực",
      "created_at": "2025-07-26 11:09:17.427000",
      "maintainer": "Nguyễn Đức Hải",
      "maintenance_type": "MONTHLY",
      "no": 2,
      "tech_spec": "Dầu thủy lực không đục, nhiệt độ ổn định",
    },
  ],
  "machine_info": {
    "machine_name": "Gap VI Automatically visual inspecttion Gap",
  },
};
dynamic getViewMaintenance_weekly_example = {
  "history": [
    {
      "action_taken": "Thay đầu mạng",
      "content": "Kiểm tra PLC",
      "created_at": "2025-07-26 12:17:39.483000",
      "maintainer": "Nguyễn Đức Hải",
      "maintenance_type": "WEEKLY",
      "no": 1,
      "tech_spec": "Dây mạng oke, đầu mạng sắp hỏng ",
    },
  ],
  "machine_info": {
    "machine_name": "Gap VI Automatically visual inspecttion Gap",
  },
};

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
