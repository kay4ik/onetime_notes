import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Onetime Notes ist kostenlos und soll es auch bleiben! Damit wir auch was von der Entwicklung haben, zeigen wir euch Werbung an. Wir geben uns mühe dass die Werbung nicht nervt oder stört."
  String get INFO_four => "Onetime Notes ist kostenlos und soll es auch bleiben! Damit wir auch was von der Entwicklung haben, zeigen wir euch Werbung an. Wir geben uns mühe dass die Werbung nicht nervt oder stört.";
  /// "Werbung"
  String get INFO_fourTitle => "Werbung";
  /// "Du hast die Möglichkeit Nachrichten zu erstellen, die entgültig gelöscht werden sobald sie gelesen werden.\nNachdem du die Nachricht erstellt hast erhälst du den Code der Nachricht. Teile diesen Code mit dem Empfänger, damit er die Nachricht öffnen und lesen kann. Oder teile die Nachricht mit einem Link."
  String get INFO_one => "Du hast die Möglichkeit Nachrichten zu erstellen, die entgültig gelöscht werden sobald sie gelesen werden.\nNachdem du die Nachricht erstellt hast erhälst du den Code der Nachricht. Teile diesen Code mit dem Empfänger, damit er die Nachricht öffnen und lesen kann. Oder teile die Nachricht mit einem Link.";
  /// "Selbstzerstörende Nachrichten"
  String get INFO_oneTitle => "Selbstzerstörende Nachrichten";
  /// "Wir sammeln keine Daten von dir oder deinem Smartphone! Wir erstellen eine Anonyme ID um zu identifizieren, welche Nachrichten von dir erstellt wurden. Diese ID ist für niemenden ersichtlich und kann nicht mit dir in verbindung gebracht werden! Falls du dies trotzdem nicht möchtest kannst du dieses Feature in den Einstellungen deaktivieren."
  String get INFO_three => "Wir sammeln keine Daten von dir oder deinem Smartphone! Wir erstellen eine Anonyme ID um zu identifizieren, welche Nachrichten von dir erstellt wurden. Diese ID ist für niemenden ersichtlich und kann nicht mit dir in verbindung gebracht werden! Falls du dies trotzdem nicht möchtest kannst du dieses Feature in den Einstellungen deaktivieren.";
  /// "Volle Privatsphäre"
  String get INFO_threeTitle => "Volle Privatsphäre";
  /// "Wurde eine Nachricht einmal geöffnet, ist sie für immer gelöscht! Es gibt keine Möglichkeit mehr (für niemanden) diese Daten wiederherzustellen.\nAls ersteller einer Nachricht kannst du sie auch löschen bevor sie gelesen wurden."
  String get INFO_two => "Wurde eine Nachricht einmal geöffnet, ist sie für immer gelöscht! Es gibt keine Möglichkeit mehr (für niemanden) diese Daten wiederherzustellen.\nAls ersteller einer Nachricht kannst du sie auch löschen bevor sie gelesen wurden.";
  /// "Keine Wiederherstellung"
  String get INFO_twoTitle => "Keine Wiederherstellung";
  /// "Onetime Notes"
  String get appTitle => "Onetime Notes";
  /// "Abbrechen"
  String get cancel => "Abbrechen";
  /// "ID kopiert!"
  String get copiedID => "ID kopiert!";
  /// "ID kopieren"
  String get copyID => "ID kopieren";
  /// "Eine neue Notiz erstellen"
  String get createNote => "Eine neue Notiz erstellen";
  /// "Fülle die Nachricht aus."
  String get createNoteFillOut => "Fülle die Nachricht aus.";
  /// "Sende die ID oder den Link an den Empfänger! Die Nachricht wird gelöscht, sobald Sie vom Empfänger geöffnet wird."
  String get createNoteFinInfo => "Sende die ID oder den Link an den Empfänger! Die Nachricht wird gelöscht, sobald Sie vom Empfänger geöffnet wird.";
  /// "Hallo, dies sind die vertraulichen Daten …"
  String get createNoteMsgHint => "Hallo, dies sind die vertraulichen Daten …";
  /// "Der Betreff ist lesbar!"
  String get createNoteSubHint => "Der Betreff ist lesbar!";
  /// "Neue Notiz"
  String get createNoteTitle => "Neue Notiz";
  /// "Notiz erstellt"
  String get createdNote => "Notiz erstellt";
  /// "Verschlüsselt"
  String get crypted => "Verschlüsselt";
  /// "Entschlüsseln"
  String get cryptedDecode => "Entschlüsseln";
  /// "Entschlüsselung fehlgeschlagen! Passwort falsch?"
  String get cryptedError => "Entschlüsselung fehlgeschlagen! Passwort falsch?";
  /// "Mit Passwort verschlüsselt!"
  String get cryptedMsg => "Mit Passwort verschlüsselt!";
  /// "Nicht verschlüsselt"
  String get cryptedNot => "Nicht verschlüsselt";
  /// "Verschlüsselt zeigen"
  String get cryptedShow => "Verschlüsselt zeigen";
  /// "Löschen"
  String get delete => "Löschen";
  /// "Bitte ID einfügen"
  String get enterIDPlease => "Bitte ID einfügen";
  /// "Betreff eingeben"
  String get enterSubject => "Betreff eingeben";
  /// "\nSolltest du Probleme beim Öffnen des Links haben, lade dir die \"Onetime Notes\" App und öffne diese ID:"
  String get link_content => "\nSolltest du Probleme beim Öffnen des Links haben, lade dir die \"Onetime Notes\" App und öffne diese ID:";
  /// "Neue Onetime Notiz erstellt!"
  String get link_subject => "Neue Onetime Notiz erstellt!";
  /// "Nachricht"
  String get message => "Nachricht";
  /// "Nachricht erstellt am"
  String get messageCreatedAt => "Nachricht erstellt am";
  /// "Mehr Informationen dazu"
  String get moreInfo => "Mehr Informationen dazu";
  /// "Keine Internetverbindung"
  String get noInternetConnection => "Keine Internetverbindung";
  /// "Du musst mit dem Internet verbunden sein, um Onetime Notes zu nutzen."
  String get noInternetConnectionInfo => "Du musst mit dem Internet verbunden sein, um Onetime Notes zu nutzen.";
  /// "Kein Betreff"
  String get noSubject => "Kein Betreff";
  /// "Notiz ID"
  String get noteID => "Notiz ID";
  /// "Eine Notiz öffnen"
  String get openNote => "Eine Notiz öffnen";
  /// "Öffnen und löschen"
  String get openNoteButtontext => "Öffnen und löschen";
  /// "Diese ID ist falsch oder die Notiz wurde bereits gelöscht."
  String get openNoteError => "Diese ID ist falsch oder die Notiz wurde bereits gelöscht.";
  /// "Wenn Sie fortfahren, wird die Nachricht aus der Datenbank gelöscht und kann nicht wiederhergestellt werden."
  String get openNoteInfotext => "Wenn Sie fortfahren, wird die Nachricht aus der Datenbank gelöscht und kann nicht wiederhergestellt werden.";
  /// "ID erfolgreich eingefügt!"
  String get openNotePasted => "ID erfolgreich eingefügt!";
  /// "Optionen"
  String get options => "Optionen";
  /// "Passwort"
  String get password => "Passwort";
  /// "Neu laden"
  String get reload => "Neu laden";
  /// "Datenschutz"
  String get sData => "Datenschutz";
  /// "Nutzerdaten erneuern"
  String get sDataRefreshUser => "Nutzerdaten erneuern";
  /// "Nutzer ID erstellen"
  String get sDataUserID => "Nutzer ID erstellen";
  /// "Um diese Einstellungen vorzunehmen, muss die App neu gestartet werden. Okay?"
  String get sRestartAlertContent => "Um diese Einstellungen vorzunehmen, muss die App neu gestartet werden. Okay?";
  /// "App wird neu gestartet"
  String get sRestartAlertTitle => "App wird neu gestartet";
  /// "Thema auswählen"
  String get sThemeSelect => "Thema auswählen";
  /// "Darstellungsoptionen"
  String get sThemeoptions => "Darstellungsoptionen";
  /// "Einstellungen"
  String get settings => "Einstellungen";
  /// "Link teilen"
  String get shareLink => "Link teilen";
  /// "Anzeigen"
  String get show => "Anzeigen";
  /// "Ungelesene Notizen"
  String get unreadNotes => "Ungelesene Notizen";
  /// "Du musst die Nutzer ID in den Einstellungen aktivieren um deine Nachrichten tracken zu können."
  String get unreadNotesError => "Du musst die Nutzer ID in den Einstellungen aktivieren um deine Nachrichten tracken zu können.";
  /// "Hier werden Nachrichten angezeigt, welche du erstellt hast und die noch nicht gelesen wurden."
  String get unreadNotesInfo => "Hier werden Nachrichten angezeigt, welche du erstellt hast und die noch nicht gelesen wurden.";
  /// "Meine Notizen"
  String get unreadNotesTitle => "Meine Notizen";
  /// "Nachricht schreiben"
  String get witeMessage => "Nachricht schreiben";
}

class _I18n_de_DE extends I18n {
  const _I18n_de_DE();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  /// "Onetime Notes is free and should remain so! So that the development is profitable we show ads in the app. We try that the ads are not disturbing or annoying you."
  @override
  String get INFO_four => "Onetime Notes is free and should remain so! So that the development is profitable we show ads in the app. We try that the ads are not disturbing or annoying you.";
  /// "Advertising"
  @override
  String get INFO_fourTitle => "Advertising";
  /// "You have the option to create messages that will be permanently deleted as soon as they are read. After you have created the message, you will receive the code of the message. Share this code with the recipient so that they can open and read the message. Or share the message with a link."
  @override
  String get INFO_one => "You have the option to create messages that will be permanently deleted as soon as they are read. After you have created the message, you will receive the code of the message. Share this code with the recipient so that they can open and read the message. Or share the message with a link.";
  /// "Self-destructive messages"
  @override
  String get INFO_oneTitle => "Self-destructive messages";
  /// "We do not collect data from you or your smartphone! We create an anonymous ID to identify which messages you have created. This ID is not visible to anyone and cannot be associated with you! If you still don't want this, you can deactivate this feature in the settings."
  @override
  String get INFO_three => "We do not collect data from you or your smartphone! We create an anonymous ID to identify which messages you have created. This ID is not visible to anyone and cannot be associated with you! If you still don't want this, you can deactivate this feature in the settings.";
  /// "Full privacy"
  @override
  String get INFO_threeTitle => "Full privacy";
  /// "Once a message has been opened, it is deleted forever! There is no longer any way (for anyone) to restore this data.\nAs the creator of a message, you can also delete it before it has been read."
  @override
  String get INFO_two => "Once a message has been opened, it is deleted forever! There is no longer any way (for anyone) to restore this data.\nAs the creator of a message, you can also delete it before it has been read.";
  /// "No recovery"
  @override
  String get INFO_twoTitle => "No recovery";
  /// "Onetime Notes"
  @override
  String get appTitle => "Onetime Notes";
  /// "Cancel"
  @override
  String get cancel => "Cancel";
  /// "Copied ID!"
  @override
  String get copiedID => "Copied ID!";
  /// "Copy ID"
  @override
  String get copyID => "Copy ID";
  /// "Create a new note"
  @override
  String get createNote => "Create a new note";
  /// "Please fill in the message."
  @override
  String get createNoteFillOut => "Please fill in the message.";
  /// "Share the link or the ID to the receiver. The message will be deleted instantly if the receiver opens it."
  @override
  String get createNoteFinInfo => "Share the link or the ID to the receiver. The message will be deleted instantly if the receiver opens it.";
  /// "Hey! This is the secret information about ..."
  @override
  String get createNoteMsgHint => "Hey! This is the secret information about ...";
  /// "The subject is readable!"
  @override
  String get createNoteSubHint => "The subject is readable!";
  /// "New note"
  @override
  String get createNoteTitle => "New note";
  /// "Note created"
  @override
  String get createdNote => "Note created";
  /// "Crypted"
  @override
  String get crypted => "Crypted";
  /// "Decrypt"
  @override
  String get cryptedDecode => "Decrypt";
  /// "Decryption failed! Wrong password?"
  @override
  String get cryptedError => "Decryption failed! Wrong password?";
  /// "Encoded by password!"
  @override
  String get cryptedMsg => "Encoded by password!";
  /// "Not crypted"
  @override
  String get cryptedNot => "Not crypted";
  /// "Show encoded"
  @override
  String get cryptedShow => "Show encoded";
  /// "Delete"
  @override
  String get delete => "Delete";
  /// "Please enter an ID"
  @override
  String get enterIDPlease => "Please enter an ID";
  /// "Enter a subject"
  @override
  String get enterSubject => "Enter a subject";
  /// "\nIf you have problems opening the link, download the \"Onetime Notes\" app and open this ID:"
  @override
  String get link_content => "\nIf you have problems opening the link, download the \"Onetime Notes\" app and open this ID:";
  /// "New Onetime note created!"
  @override
  String get link_subject => "New Onetime note created!";
  /// "Message"
  @override
  String get message => "Message";
  /// "Message created on"
  @override
  String get messageCreatedAt => "Message created on";
  /// "More information about it"
  @override
  String get moreInfo => "More information about it";
  /// "No internet connection"
  @override
  String get noInternetConnection => "No internet connection";
  /// "You have to be connected to the Internet to use Onetime Notes."
  @override
  String get noInternetConnectionInfo => "You have to be connected to the Internet to use Onetime Notes.";
  /// "No subject"
  @override
  String get noSubject => "No subject";
  /// "Note ID"
  @override
  String get noteID => "Note ID";
  /// "Open a Note"
  @override
  String get openNote => "Open a Note";
  /// "Open and delete"
  @override
  String get openNoteButtontext => "Open and delete";
  /// "This ID is incorrect or the note has already been deleted."
  @override
  String get openNoteError => "This ID is incorrect or the note has already been deleted.";
  /// "If you continue, the message will be deleted from the database and cannot be recovered."
  @override
  String get openNoteInfotext => "If you continue, the message will be deleted from the database and cannot be recovered.";
  /// "ID successfully inserted!"
  @override
  String get openNotePasted => "ID successfully inserted!";
  /// "Options"
  @override
  String get options => "Options";
  /// "Password"
  @override
  String get password => "Password";
  /// "Reload"
  @override
  String get reload => "Reload";
  /// "Data protection"
  @override
  String get sData => "Data protection";
  /// "Renew user data"
  @override
  String get sDataRefreshUser => "Renew user data";
  /// "Create a user ID"
  @override
  String get sDataUserID => "Create a user ID";
  /// "To make these settings, the app must be restarted. Ok?"
  @override
  String get sRestartAlertContent => "To make these settings, the app must be restarted. Ok?";
  /// "App will be restarted"
  @override
  String get sRestartAlertTitle => "App will be restarted";
  /// "Select a theme"
  @override
  String get sThemeSelect => "Select a theme";
  /// "Display options"
  @override
  String get sThemeoptions => "Display options";
  /// "Settings"
  @override
  String get settings => "Settings";
  /// "Share link"
  @override
  String get shareLink => "Share link";
  /// "Show"
  @override
  String get show => "Show";
  /// "Unread notes"
  @override
  String get unreadNotes => "Unread notes";
  /// "You have to activate the user ID in the settings to be able to track your messages."
  @override
  String get unreadNotesError => "You have to activate the user ID in the settings to be able to track your messages.";
  /// "Here you can see notes you created if they are not read yet."
  @override
  String get unreadNotesInfo => "Here you can see notes you created if they are not read yet.";
  /// "My Notes"
  @override
  String get unreadNotesTitle => "My Notes";
  /// "Write a Message"
  @override
  String get witeMessage => "Write a Message";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("de", "DE"),
      Locale("en", "US")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("de_DE" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_de_DE());
    }
    else if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("de" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_de_DE());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}