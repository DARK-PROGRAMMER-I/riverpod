import 'common_libs.dart';

final counter = StateProvider((ref) => 0);

class StateProviderTut extends ConsumerStatefulWidget {
  const StateProviderTut({super.key, required this.title});
  final String title;

  @override
  ConsumerState<StateProviderTut> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<StateProviderTut> {

  @override
  Widget build(BuildContext context) {
    int value = ref.watch(counter).toInt();
    print(value);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                ref.read(counter.notifier).update((state) => state = 0);
              },
              icon: Icon(Icons.refresh)
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counter.notifier).update((state) => state+ 1);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
