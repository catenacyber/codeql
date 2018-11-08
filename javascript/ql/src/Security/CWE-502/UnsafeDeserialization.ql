/**
 * @name Deserialization of user-controlled data
 * @description Deserializing user-controlled data may allow attackers to
 *              execute arbitrary code.
 * @kind path-problem
 * @problem.severity warning
 * @precision high
 * @id js/unsafe-deserialization
 * @tags security
 *       external/cwe/cwe-502
 */

import javascript
import semmle.javascript.security.dataflow.UnsafeDeserialization::UnsafeDeserialization
import DataFlow::PathGraph

from Configuration cfg, DataFlow::Node source, DataFlow::Node sink
where cfg.hasFlow(source, sink)
select sink, "Unsafe deserialization of $@.", source, "user input"
