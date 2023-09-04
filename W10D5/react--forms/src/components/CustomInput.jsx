// import React, { forwardRef } from "react";
// import "./input.css";

// const CustomInput = forwardRef((props, ref) => {
//   const { label, name, value, onBlur, onChange } = props;
//   const handleBlur = (event) => {
//     const { name, value } = event.target;
//     if (name === "name" && value.length < 5) {
//       event.target.setCustomValidity("Name must be at least 5 characters");
//       event.target.classList.add("invalid");
//     } else if (name === "email" && !/\S+@\S+\.\S+/.test(value)) {
//       event.target.setCustomValidity("Invalid email address");
//       event.target.classList.add("invalid");
//     } else if (name === "message" && value.length < 10) {
//       event.target.setCustomValidity("Message must be at least 10 characters");
//       event.target.classList.add("invalid");
//     } else if (name === "phone" && !/^\d{3}-\d{3}-\d{4}$/.test(value)) {
//       event.target.setCustomValidity(
//         "Invalid phone number format (xxx-xxx-xxxx)"
//       );
//       event.target.classList.add("invalid");
//     } else {
//       event.target.setCustomValidity("");
//       event.target.classList.remove("invalid");
//       event.target.classList.add("valid");
//     }
//     onBlur(event);
//   };

//   const handleChange = (event) => {
//     onChange(event);
//   };

//   return (
//     <label>
//       {label}:
//       <input
//         type="text"
//         name={name}
//         value={value}
//         onBlur={handleBlur}
//         onChange={handleChange}
//         ref={ref}
//         required
//       />
//     </label>
//   );
// });

// export default CustomInput;
import React, { forwardRef } from "react";

const CustomInput = forwardRef((props, ref) => {
  const { label, name, value, onBlur, onChange } = props;

  return (
    <div>
      <label htmlFor={name}>{label}</label>
      <input
        type="text"
        id={name}
        name={name}
        value={value}
        onBlur={onBlur}
        onChange={onChange}
        ref={ref}
      />
    </div>
  );
});

export default CustomInput;
