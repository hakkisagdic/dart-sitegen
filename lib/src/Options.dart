part of sitegen;

class Options {
    static const APPNAME                    = 'sitegen';

    static const _ARG_HELP                  = 'help';
    static const _ARG_LOGLEVEL              = 'loglevel';
    static const _ARG_SETTINGS              = 'settings';
    static const _ARG_GENERATE              = 'generate';
    static const _ARG_SERVE                 = 'serve';
    static const _ARG_PORT                  = 'port';
    static const _ARG_WATCH                 = 'watch';

    static const _ARG_TEST                  = 'test';

    final ArgParser _parser;

    Options() : _parser = Options._createParser();

    ArgResults parse(final List<String> args) {
        Validate.notNull(args);
        return _parser.parse(args);
    }

    void showUsage() {
        print("Usage: $APPNAME [options]");
        _parser.getUsage().split("\n").forEach((final String line) {
            print("    $line");
        });

        print("");
        print("Sample:");
        print("");
        print("    'Observes the default dirs and serves the web-folder:  '$APPNAME -w --serve'");
        print("    'Generates the static site in your 'web-folder':       '$APPNAME -g'");
        print("");
    }

    // -- private -------------------------------------------------------------

    static ArgParser _createParser() {
        final ArgParser parser = new ArgParser()

            ..addFlag(_ARG_SETTINGS,         abbr: 's', negatable: false, help: "Prints settings")
            ..addFlag(_ARG_HELP,             abbr: 'h', negatable: false, help: "Shows this message")
            ..addFlag(_ARG_GENERATE,         abbr: 'g', negatable: false, help: "Generate site")
            //..addFlag(_ARG_TEST,             abbr: 't', negatable: false, help: "Test")

            ..addFlag(_ARG_WATCH,            abbr: 'w', negatable: false, help: "Observes SRC-dir")

            ..addFlag(_ARG_SERVE,                       negatable: false, help: "Serves your site")

            ..addOption(_ARG_PORT,                      help: "Sets the port to listen on", defaultsTo: "8000")

            ..addOption(_ARG_LOGLEVEL,       abbr: 'v', help: "Sets the appropriate loglevel", allowed: ['info', 'debug', 'warning'])
        ;

        return parser;
    }
}