class AccountHead {
  String? code;
  String? hname;
  String? gtype;
  String? ad1;
  String? ad2;
  String? ad3;
  String? aid;
  String? ph;
  String? ba;
  String? ri;
  String? rc;
  String? ht;
  String? mo;
  String? gst;
  String? ac;
  String? cag;

  AccountHead(
      {this.code,
      this.hname,
      this.gtype,
      this.ad1,
      this.ad2,
      this.ad3,
      this.aid,
      this.ph,
      this.ba,
      this.ri,
      this.rc,
      this.ht,
      this.mo,
      this.gst,
      this.ac,
      this.cag});

  AccountHead.fromJson(Map<String, dynamic> json) {
    code = json['code'].toString().trimLeft();
    hname = json['hname'].toString().trimLeft();
    gtype = json['gtype'].toString().trimLeft();
    ad1 = json['ad1'].toString().trimLeft();
    ad2 = json['ad2'].toString().trimLeft();
    ad3 = json['ad3'].toString().trimLeft();
    aid = json['area_id'].toString().trimLeft();
    ph = json['ph'].toString().trimLeft();
    ba = json['ba'].toString().trimLeft();
    ri = json['ri'].toString().trimLeft();
    rc = json['rc'].toString().trimLeft();
    ht = json['ht'].toString().trimLeft();
    mo = json['mo'].toString().trimLeft();
    gst = json['gst'].toString().trimLeft();
    ac = json['ac'].toString().trimLeft();
    cag = json['cag'].toString().trimLeft();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['hname'] = this.hname;
    data['gtype'] = this.gtype;
    data['ad1'] = this.ad1;
    data['ad2'] = this.ad2;
    data['ad3'] = this.ad3;
    data['area_id'] = this.aid;
    data['ph'] = this.ph;
    data['ba'] = this.ba;
    data['ri'] = this.ri;
    data['rc'] = this.rc;
    data['ht'] = this.ht;
    data['mo'] = this.mo;
    data['gst'] = this.gst;
    data['ac'] = this.ac;
    data['cag'] = this.cag;
    return data;
  }
}
