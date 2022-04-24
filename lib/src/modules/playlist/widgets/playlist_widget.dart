import 'package:flutter/material.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _itemLeft(index),
            itemCount: 3,
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => _itemRight(index),
            itemCount: 3,
          ),
        ),
      ],
    ));
  }

  Widget _itemLeft(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          'https://s3-alpha-sig.figma.com/img/fe7e/63eb/8a7ab0eb7f4f58c04b156c6149fc358c?Expires=1651449600&Signature=fw5vjEh5osW6S4pa~pxNukzXWgOJ-88GLdTEfrHfIZcLPNkKuC7bs59aBub4nzQhVYeypaIR2fYF8DDQBV6nqnMpjB6G0Z~gz2nEyJqjmJ7ifV6-VMr46Axe34rOjH5s1Tp7S3h2CPOInRIJ4LNMYmyA2XIA3r2BrdfDL-COT~FItNsR21Jmh-kRRjI9-RAtBtO60Rh-oC5gzk8UyNF8en7eELQjjMF1qyw3TZ7F4-FhYmc-nOvPJFz5uy~i5njZkyO6lRlisoh2dxQuh07QHjfYPYWpw30vKvyUSnqdFIedCWoETxzOO19OMEIB0NOszIqhrxExYPbNo4~L6DMpFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          width: 178.52,
          fit: BoxFit.fill,
          height: index % 2 == 0 ? 162 : 179,
        ),
      ),
    );
  }

  Widget _itemRight(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          'https://s3-alpha-sig.figma.com/img/2b6a/48ac/77305651cd9ac12b8618b0cc14fd71a6?Expires=1651449600&Signature=L34-gdyr~1-PCpIxpT~5~cODzLBT6hQZsdLn0xKRBY9eufJIdWFkxmP7QQShuMnate7tJZoPp3nTQKFj8IRRBZxPX2NwFf1Q1T~oS85eRSRf8W2dwEDM9aJ15ZahLvWa3UyaHVfh-vEo7~eZPf-ORDbcDdDYVmCvLSPidDaPJ-lykw1ZVUwhz-3DtSRaTyJinPpDSppjiDnAPrU1DiUu0-TatfeeMOrq7lb0DsZueBJjn~8VbLgRycgRM69kgk3XTBu-tPAUjP9Reev5-ofM-tSyAmfnLMOkrjAgBu6~zExFlQNEYKykpHCLEL~b8cT4gWJSCfyTiWOvKEayZ7o1iA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          width: 182.5,
          fit: BoxFit.fill,
          height: index % 2 == 0 ? 122.33 : 182,
        ),
      ),
    );
  }
}
