#!/usr/bin/bash

PROFILE_DIR="profiles"
mkdir -p "$PROFILE_DIR"
CPU_PROFILE="$PROFILE_DIR/cpu.pprof"
MEM_PROFILE="$PROFILE_DIR/mem.pprof"
BLOCK_PROFILE="$PROFILE_DIR/block.pprof"
MUTEX_PROFILE="$PROFILE_DIR/mutex.pprof"

echo "Running tests with profiling..."
go test -cpuprofile="$CPU_PROFILE" \
  -memprofile="$MEM_PROFILE" \
  -blockprofile="$BLOCK_PROFILE" \
  -mutexprofile="$MUTEX_PROFILE" \
  -o "$PROFILE_DIR/test.bin" ./...

if [[ ! -f "$CPU_PROFILE" ]] ||
  [[ ! -f "$MEM_PROFILE" ]] ||
  [[ ! -f "$BLOCK_PROFILE" ]] ||
  [[ ! -f "$MUTEX_PROFILE" ]]; then
  echo "Error: Not all profiles were created. Ensure that the tests completed successfully."
  exit 1
fi

echo "Starting pprof to display all profiles..."
go tool pprof -http=:8080 "$CPU_PROFILE" &
go tool pprof -http=:8081 "$MEM_PROFILE" &
go tool pprof -http=:8082 "$BLOCK_PROFILE" &
go tool pprof -http=:8083 "$MUTEX_PROFILE" &

echo "Press any key to stop profiling servers..."
read -n1 -s

pkill -f "pprof.*:808[0-3]" || {
  kill $(lsof -t -i:8080) 2>/dev/null
  kill $(lsof -t -i:8081) 2>/dev/null
  kill $(lsof -t -i:8082) 2>/dev/null
  kill $(lsof -t -i:8083) 2>/dev/null
}
