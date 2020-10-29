import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '申领信息填报',
    home: new SampleForm(value: 'hello'),
  ));
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchSelected, //当前状态
      onChanged: (value) {
        //重新构建页面
        setState(() {
          _switchSelected = value;
        });
      },
    );
  }
}

class FormFieldWidget extends StatefulWidget {
  final String title;
  final String inputContent;
  final String errorContent;
  final String type;

  const FormFieldWidget(
      {this.title, this.inputContent, this.errorContent, this.type})
      : super();

  @override
  State<StatefulWidget> createState() =>
      formFieldState = FormFieldState(title, inputContent, errorContent, type);
}

FormFieldState formFieldState;
String name, phone, address, visitor;

class FormFieldState extends State<FormFieldWidget> {
  final String title;
  final String inputContent;
  final String errorContent;
  final String type;

  FormFieldState(this.title, this.inputContent, this.errorContent, this.type);

  @override
  Widget build(BuildContext context) {
    var promoteVisible = false;
    Widget textField = Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "*",
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Color(0xFF262626)),
              ),
              Offstage(
                offstage: !promoteVisible,
                child: Row(
                  children: [
                    Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.only(left: 10, right: 4),
                        child: Image.asset('assets/images/tanhao.png')),
                    Text(
                      errorContent,
                      style: TextStyle(fontSize: 12, color: Color(0xFFFA541C)),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              height: 36,
              margin: EdgeInsets.only(top: 8),
              decoration: new BoxDecoration(
                border: new Border.all(
                    color: Color(0xFFD9D9D9), width: 1), // 边色与边宽度
              ),
              child: new Container(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(fontSize: 14, color: Color(0xFFBFBFBF)),
                    hintText: inputContent,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14, color: Color(0xFF262626)),
                  onChanged: (value) {
                    setState(() {
                      switch (type) {
                        case "name":
                          name = value;
                          if (value.length >= 20) {
                            promoteVisible = true;
                          } else {
                            promoteVisible = false;
                          }
                          break;
                        case "phone":
                          phone = value;
                          if (value.length >= 20) {
                            promoteVisible = true;
                          } else {
                            promoteVisible = false;
                          }
                          break;
                        case "visitor":
                          visitor = visitor;
                          if (value.length >= 20) {
                            promoteVisible = true;
                          } else {
                            promoteVisible = false;
                          }
                          break;
                        case "address":
                          address = address;
                          if (value.length >= 20) {
                            promoteVisible = true;
                          } else {
                            promoteVisible = false;
                          }
                          break;
                        default:
                          break;
                      }
                    });
                  },
                ),
              ))
        ],
      ),
    );
    return textField;
  }
}

// ignore: must_be_immutable
class SampleForm extends StatelessWidget {
  final value;

  FormFieldWidget nameField, phoneField, addressField, visitorFormField;

  SampleForm({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget formColumn = Column(
      children: <Widget>[
        // "收件人姓名", "请输入收件人手机号", "姓名不能超过20个字符串"
        nameField = new FormFieldWidget(
            title: "收件人姓名",
            inputContent: "请输入姓名",
            errorContent: "姓名不能超过20个字符串",
            type: "name"),
        phoneField = new FormFieldWidget(
          title: "收件人手机号",
          inputContent: "请输入手机号",
          errorContent: "手机号码格式不正确",
          type: "phone",
        ),
        addressField = new FormFieldWidget(
          title: "收件人地址",
          inputContent: "请输入收件人地址",
          errorContent: "收件地址不能超过20个字符",
          type: "address",
        ),
      ],
    );

    SwitchAndCheckBoxTestRoute switchBtn = new SwitchAndCheckBoxTestRoute();

    Widget switchField = new Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "是否线下接待",
            style: TextStyle(fontSize: 14, color: Color(0xFF262626)),
          ),
          switchBtn
        ],
      ),
    );

    Widget submit = new Container(
      width: 280,
      height: 44,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text(
                "提交",
                style: TextStyle(fontSize: 14),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
            ),
          ),
        ],
      ),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('申领信息填报'),
        ),
        body: Container(
          color: Color(0xFFF5F5F5),
          padding: EdgeInsets.only(top: 6),
          child: new SingleChildScrollView(
              child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 120.0,
            ),
            child: Column(
              children: [
                formColumn,
                Container(
                  padding: EdgeInsets.only(top: 7),
                ),
                Container(
                    child: Column(
                  children: [
                    switchField,
                    visitorFormField = FormFieldWidget(
                      title: "线下接待人员",
                      inputContent: " ",
                      errorContent: "线下接待人员不能超过20个字符",
                      type: "visitor",
                    )
                  ],
                )),
                Container(
                  margin: EdgeInsets.only(
                    top: 49,
                  ),
                  child: submit,
                )
              ],
            ),
          )
              // child:
              ),
        ));
  }
}
