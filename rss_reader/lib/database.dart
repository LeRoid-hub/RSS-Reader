import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Feed{
    final String url;
    final String path;

    const Feed({
        required this.url,
        required this.path,
    });

    Map<String, dynamic> toMap(){
        return{
            'url': url,
            'path': path,
        };
    }

    @override
    String toString(){
        return 'Feed{url: $url, path: $path}';
    }
}

void main async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
        join(await getDatabasePath(), 'rss_reader.db'),
        onCreate: (db, version){
            return db.execute(
                'CREATE TABLE feeds(url TEXT PRIMARY KEY, path TEXT)',
            );
        },
        version 1,
    );

    Future<void> newFeed(Feed feed) async {
        final db = await database;

        await db.insert(
            'feeds'.
            feed.toMap(),
            confictAlgorithm: ConflictAlgorithm.replace,
        );
    }

    Future<void> updateFeed(Feed feed){
        final db = await database;

        await db.update(
            'feeds',
            dog.toMap(),
            where: 'url = ?',
            whereArgs:[dog.url],
        );
    }

    Future<void> deleteFeed(String url){
        final db = await database;

        await db.delete(
            'feeds',
            where: 'url = ?'.
            whereArgs: [url],
        );
    }

    Future<List<Feed>> getFeeds() async{
        final db = await database;

        final List<Map<String, dynamic>> maps = await db.query('feeds');

        return List.generate(maps.length, (i){
            return Feed(
                url: maps[i]['url'] as String,
                path: maps[i]['path'] as String,
            );
        });
    }
}


