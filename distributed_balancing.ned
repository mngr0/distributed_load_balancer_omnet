//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

//
// TODO auto-generated type
//



import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network Distributed_balancing
{
    @display("bgb=627,377");
    submodules:
        source: Source {
            @display("p=66,58");
        }
        source1: Source {
            @display("p=66,187");
        }
        router: Router {
            @display("p=164,187");
        }
        router1: Router {
            @display("p=164,58");
        }
        passiveQueue: PassiveQueue {
            @display("p=260,187");
        }
        passiveQueue1: PassiveQueue {
            @display("p=260,58");
        }
        server: Server {
            @display("p=357,187");
        }
        server1: Server {
            @display("p=357,58");
        }
        sink: Sink {
            @display("p=442,187");
        }
        sink1: Sink {
            @display("p=436,58");
        }
    connections:
        source.out --> router1.in++;
        source1.out --> router.in++;
        router.out++ --> passiveQueue.in++;
        router.out++ --> passiveQueue1.in++;
        router1.out++ --> passiveQueue1.in++;
        router1.out++ --> passiveQueue.in++;
        passiveQueue1.out++ --> server1.in++;
        passiveQueue.out++ --> server.in++;
        server.out --> sink.in++;
        server1.out --> sink1.in++;
}
