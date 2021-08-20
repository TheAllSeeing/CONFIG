data class App(val installed: Array<Device> ) {


    enum class Device {
        ALL_SEER,
        NO_SEER,
        MINI_SEER,
        WEB;
    }
}
