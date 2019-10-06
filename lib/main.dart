// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';  // 19.10.07 by YoungJun

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // step 4: ListView 무한 스크롤링
  final _suggestions = <WordPair>[];  // 제안하는 단어 쌍을 저장하기 위해
  final _biggerFont = const TextStyle(fontSize: 18.0);  // 폰트 사이즈를 크게 만들기 위해
  // Dart 언어에서는 _(언더스코어)를 식별자의 prefix 로 붙이면 privacy 가 강제 적용
  @override
  Widget build(BuildContext context) {
    // 단어 생성 라이브러리를 직접 호출하지 않고 _buildSuggestions 사용
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    // 제안하는 단어쌍을 표시하는 ListView 를 빌드
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // _buildSuggestions 함수는 각 단어 쌍마다 _buildRow 를 호출
  // 이 함수는 ListTIle 안에서 새로운 쌍을 표시
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

/*
/*1*/ itemBuilder 콜백은 제안된 단어 쌍 마다 한번씩 호출되며 각 제안을 ListTile 행에 위치해 준다
 짝수행의 ListTile 함수는 단어 쌍에 대한 ListTile 행을 추가한다
 홀수행의 Divider 함수는 Divider 위젯을 추가하여 항목을 시각적으로 분리한다.
 작은 장치에서는 구분선이 잘 보이지 않을 수도 있다

/*2*/ ListView 각 행 앞에 1 픽셀 높이의 구분선 위젯을 추가한다

/*3*/ i ~/ 2 표현식은 i에서 2를 나누고 나머지 정수를 리턴
예를들면, 1,2,3,4,5는 0,1,1,2,2가 된다.
이것은 ListView 에서 Divider 위젯을 제외한 단어 쌍의 실제 숫자를 계산한다.

/*4*/ 사용 가능한 단어 페어링이 끝났으면 10개를 더 생성하고 제안 목록에 추가
*/

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
